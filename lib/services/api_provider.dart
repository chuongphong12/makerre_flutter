import 'package:dio/dio.dart';
import 'package:makerre_flutter/constants/api_constant.dart';
import 'package:makerre_flutter/services/storage_service.dart';

class Api {
  Dio dio = Dio();
  String? accessToken;

  final _storage = StorageService();

  Api() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          accessToken = await _storage.readSecureData('access_token');
          if (!options.path.contains('http')) {
            options.path = '$baseURL/${options.path}';
          }
          if (accessToken != null && accessToken != '') {
            options.headers['Authorization'] = 'Bearer $accessToken';
            options.headers['X-Requested-With'] = 'XMLHttpRequest';
          }
          return handler.next(options);
        },
        onError: (DioError error, handler) {
          if (error.response?.statusCode == 401) {
            _storage.deleteAllSecureData();
          }
          return handler.next(error);
        },
      ),
    );

    Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
      final options = Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
      );
      return dio.request<dynamic>(
        requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options,
      );
    }
  }
}
