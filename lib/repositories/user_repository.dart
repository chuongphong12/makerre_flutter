import 'package:dio/dio.dart';
import 'package:makerre_flutter/constants/api_constant.dart';
import 'package:makerre_flutter/models/Response.dart';
import 'package:makerre_flutter/models/user_model.dart';
import 'package:makerre_flutter/services/api_provider.dart';

class UserRepository {
  final _api = Api();
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) return _user;
    Response<ApiResponse<User>> response = await _api.dio.get('$baseURL/app/admin/profile');

    ApiResponse apiResponse = ApiResponse.fromJson(response.data);
    return _user = User.fromJson(apiResponse.data);
  }
}
