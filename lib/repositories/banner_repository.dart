import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:makerre_flutter/constants/api_constant.dart';
import 'package:makerre_flutter/models/Response.dart';
import 'package:makerre_flutter/models/banner_model.dart';
import 'package:makerre_flutter/services/api_provider.dart';

BannerList bannerFromJson(String str) => BannerList.fromJson(json.decode(str));

String bannerToJson(BannerList data) => json.encode(data.toJson());

class BannerList {
  BannerList({
    required this.totalItems,
    required this.docs,
    required this.totalPages,
    required this.currentPage,
  });

  final int totalItems;
  final List<BannerModel> docs;
  final int totalPages;
  final int currentPage;

  factory BannerList.fromJson(Map<String, dynamic> json) => BannerList(
        totalItems: json["totalItems"],
        docs: List<BannerModel>.from(
            json["docs"].map((x) => BannerModel.fromJson(x))),
        totalPages: json["totalPages"],
        currentPage: json["currentPage"],
      );

  Map<String, dynamic> toJson() => {
        "totalItems": totalItems,
        "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
        "totalPages": totalPages,
        "currentPage": currentPage,
      };
}

class BannerRepository {
  final _api = Api();

  Future<List<BannerModel>> getBanner() async {
    List<BannerModel> banners;
    try {
      Response response = await _api.dio.get(
        '$baseURL/app/banner/paginate',
        options: Options(
          headers: {'limit': 10, 'page': 1, 'sort': 'desc', 'type': 'main'},
        ),
      );
      if (response.statusCode == 200) {
        BannerList apiResponse = BannerList.fromJson(response.data['data']);
        banners = apiResponse.docs;
        return banners;
      } else {
        return banners = [];
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

  Future<BannerModel> getBannerDetail(int id) async {
    BannerModel banner;
    try {
      Response response = await _api.dio.get(
        '$baseURL/app/banner',
        options: Options(
          headers: {'id': id},
        ),
      );
      ApiResponse apiRes = ApiResponse.fromJson(response.data);
      banner = BannerModel.fromJson(apiRes.data);
      return banner;
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
