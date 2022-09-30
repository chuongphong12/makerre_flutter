// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);
import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.totalItems,
    required this.docs,
    required this.totalPages,
    required this.currentPage,
  });

  final int totalItems;
  final List<Doc> docs;
  final int totalPages;
  final int currentPage;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        totalItems: json["totalItems"],
        docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
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

class Doc {
  Doc({
    required this.name,
    required this.id,
    required this.companyName,
    required this.introduction,
    required this.longitude,
    required this.latitude,
    required this.price,
    required this.portfolioInfo,
    required this.location,
    required this.avgcount,
    required this.ratingCount,
    required this.reviewcount,
    required this.isFavorite,
  });

  final String name;
  final int id;
  final String companyName;
  final String introduction;
  final int longitude;
  final int latitude;
  final int price;
  final List<PortfolioInfo> portfolioInfo;
  final double location;
  final int avgcount;
  final int ratingCount;
  final int reviewcount;
  final bool isFavorite;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        name: json["name"],
        id: json["id"],
        companyName: json["companyName"],
        introduction: json["introduction"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        price: json["price"],
        portfolioInfo: List<PortfolioInfo>.from(
            json["portfolioInfo"].map((x) => PortfolioInfo.fromJson(x))),
        location: json["location"].toDouble(),
        avgcount: json["avgcount"],
        ratingCount: json["ratingCount"],
        reviewcount: json["reviewcount"],
        isFavorite: json["isFavorite"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "companyName": companyName,
        "introduction": introduction,
        "longitude": longitude,
        "latitude": latitude,
        "price": price,
        "portfolioInfo":
            List<dynamic>.from(portfolioInfo.map((x) => x.toJson())),
        "location": location,
        "avgcount": avgcount,
        "ratingCount": ratingCount,
        "reviewcount": reviewcount,
        "isFavorite": isFavorite,
      };
}

class PortfolioInfo {
  PortfolioInfo({
    required this.services,
    required this.id,
    required this.attachmentsAfter,
    required this.attachmentsBefore,
    required this.brand,
    required this.estimateTime,
    required this.categories,
    required this.price,
  });

  final List<Service> services;
  final int id;
  final String attachmentsAfter;
  final String attachmentsBefore;
  final String brand;
  final String estimateTime;
  final List<String> categories;
  final int price;

  factory PortfolioInfo.fromJson(Map<String, dynamic> json) => PortfolioInfo(
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
        id: json["id"],
        attachmentsAfter: json["attachmentsAfter"],
        attachmentsBefore: json["attachmentsBefore"],
        brand: json["brand"],
        estimateTime: json["estimateTime"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
        "id": id,
        "attachmentsAfter": attachmentsAfter,
        "attachmentsBefore": attachmentsBefore,
        "brand": brand,
        "estimateTime": estimateTime,
        "categories":
            List<String>.from(categories.map((x) => x)),
        "price": price,
      };
}

class Service {
  Service({
    required this.image,
    required this.name,
    required this.id,
  });

  final String image;
  final String name;
  final int id;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        image: json["image"],
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "id": id,
      };
}
