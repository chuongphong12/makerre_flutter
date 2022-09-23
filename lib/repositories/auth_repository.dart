import 'dart:async';

import 'package:dio/dio.dart';
import 'package:makerre_flutter/constants/api_constant.dart';
import 'package:makerre_flutter/models/Response.dart';
import 'package:makerre_flutter/models/token_model.dart';
import 'package:makerre_flutter/services/storage_service.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthRepositories {
  final Dio _dio = Dio();
  final StorageService _storageService = StorageService();
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    final bool hasToken = await _storageService.hasToken();
    if (hasToken) {
      yield AuthenticationStatus.authenticated;
    } else {
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _controller.stream;
  }

  Future<String> logIn({
    required String email,
    required String password,
  }) async {
    Token? token;
    _dio.options.headers['X-Requested-With'] = 'XMLHttpRequest';
    try {
      Response response = await _dio.post('$baseURL/app/admin/login', data: {
        'account': email,
        'password': password,
        'deviceToken':
            'd6DijQiLQrm0OikyRx2KoV:APA91bF3-S7tZsSCezikahyorSlwP1fDw25S2t-JMZMtaOegkOSdYHIysMDHTLCQOWMY7VJZfQwIYcevjGAZXeR_JJ5dxfEC76jIeCIRP1f7U5mUt5eoyJCljQmhPt_Fv0TaweH3dCN',
      });
      ApiResponse resp = ApiResponse.fromJson(response.data);
      token = Token.fromJson(resp.data);
      if (response.statusCode == 200) {
        return token.token;
      } else {
        throw Exception('Failed to login');
      }
    } on DioError catch (e) {
      var error = e.response!.data['errors'];
      if (error['password'] != null) {
        throw error['password'];
      } else {
        throw error['email'];
      }
    } catch (exception) {
      rethrow;
    }
  }

  void logOut() async {
    _controller.add(AuthenticationStatus.unauthenticated);
    // if (await AuthApi.instance.hasToken()) {
    //   try {
    //     await UserApi.instance.logout();
    //     await UserApi.instance.unlink();
    //   } catch (e) {
    //     print('Logout or Unlink fails.');
    //   }
    // }
  }

  void dispose() => _controller.close();
}
