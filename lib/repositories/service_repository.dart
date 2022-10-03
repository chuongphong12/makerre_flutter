import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:makerre_flutter/constants/api_constant.dart';
import 'package:makerre_flutter/models/Response.dart';
import 'package:makerre_flutter/models/product_model.dart';
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

class ICategory {
  ICategory({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory ICategory.fromJson(Map<String, dynamic> json) => ICategory(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
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
        service = List<IService>.from(
          apiResponse.data['docs'].map(
            (el) => IService.fromJson(el),
          ),
        );
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

  Future<List<ICategory>> getCategory() async {
    List<ICategory> categories;

    try {
      Response response = await _api.dio.get('$baseURL/app/category');
      if (response.statusCode == 200) {
        ApiResponse apiResponse = ApiResponse.fromJson(response.data);
        categories = List<ICategory>.from(
          apiResponse.data['docs'].map(
            (val) => ICategory.fromJson(val),
          ),
        );
        return categories;
      } else {
        return categories = [];
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

  Future<Product> getProduct({
    required int categoryId,
    required int serviceId,
  }) async {
    Product products;
    try {
      Response response = await _api.dio.get(
        '$baseURL/app/admin/get-products',
        options: Options(
          headers: {
            'limit': 100,
            'page': 1,
            'sort': 'desc',
            'categoryid': categoryId,
            'sortfield': 'location',
            'sorttype': 'desc',
            'serviceid': serviceId,
            'isfavorite': false,
          },
        ),
      );
      ApiResponse apiResponse = ApiResponse.fromJson(response.data);
      products = Product.fromJson(apiResponse.data);
      return products;
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
