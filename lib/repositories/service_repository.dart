import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:makerre_flutter/constants/api_constant.dart';
import 'package:makerre_flutter/models/Response.dart';
import 'package:makerre_flutter/services/api_provider.dart';

class IService {
  IService({
    required this.id,
    required this.name,
    required this.image,
  });

  final int id;
  final String name;
  final String image;

  factory IService.fromJson(Map<String, dynamic> json) => IService(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}

class ServiceRepository {
  final _api = Api();

  Future<List<IService>> getService() async {
    List<IService> service;
    try {
      Response response = await _api.dio.get('$baseURL/app/service');
      if (response.statusCode == 200) {
        ApiResponse apiResponse = ApiResponse.fromJson(response.data);
        service = List<IService>.from(apiResponse.data['docs'].map((el) => IService.fromJson(el)));
        return service;
      } else {
        return service = [];
      }
    } on DioError catch (e) {
      var error = e.error.toString();
      if (kDebugMode) {
        print(error);
      }
      throw error;
    } catch (exception) {
      rethrow;
    }
  }
}
