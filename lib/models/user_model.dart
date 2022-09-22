// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.services,
    required this.id,
    required this.email,
    required this.role,
    required this.name,
    required this.phone,
    required this.password,
    required this.gender,
    required this.birthday,
    required this.avatar,
    required this.postal,
    required this.address,
    required this.companyName,
    required this.companyContact,
    required this.delivery,
    required this.addressManual,
    required this.typeLogin,
    required this.introduction,
    required this.status,
    required this.longitude,
    required this.latitude,
    required this.price,
    required this.bankAccountHolder,
    required this.bankName,
    required this.bankNumberAccount,
    required this.appealCount,
    required this.isDeletedByUser,
    required this.region,
    required this.provinceInfo,
    required this.districtInfo,
    required this.portfolioInfo,
    required this.service,
    required this.userCategories,
    required this.userHashtags,
    required this.bankImage,
  });

  final dynamic services;
  final int id;
  final String email;
  final String role;
  final String name;
  final String phone;
  final String password;
  final String gender;
  final String birthday;
  final String avatar;
  final String postal;
  final String address;
  final dynamic companyName;
  final dynamic companyContact;
  final dynamic delivery;
  final String addressManual;
  final String typeLogin;
  final dynamic introduction;
  final String status;
  final String longitude;
  final String latitude;
  final int price;
  final dynamic bankAccountHolder;
  final dynamic bankName;
  final dynamic bankNumberAccount;
  final int appealCount;
  final bool isDeletedByUser;
  final dynamic region;
  final dynamic provinceInfo;
  final dynamic districtInfo;
  final List<dynamic> portfolioInfo;
  final dynamic service;
  final List<dynamic> userCategories;
  final List<dynamic> userHashtags;
  final dynamic bankImage;

  User copyWith({
    dynamic services,
    required int id,
    required String email,
    required String role,
    required String name,
    required String phone,
    required String password,
    required String gender,
    required String birthday,
    required String avatar,
    required String postal,
    required String address,
    dynamic companyName,
    dynamic companyContact,
    dynamic delivery,
    required String addressManual,
    required String typeLogin,
    dynamic introduction,
    required String status,
    required String longitude,
    required String latitude,
    required int price,
    dynamic bankAccountHolder,
    dynamic bankName,
    dynamic bankNumberAccount,
    required int appealCount,
    required bool isDeletedByUser,
    dynamic region,
    dynamic provinceInfo,
    dynamic districtInfo,
    required List<dynamic> portfolioInfo,
    dynamic service,
    required List<dynamic> userCategories,
    required List<dynamic> userHashtags,
    dynamic bankImage,
  }) =>
      User(
        services: services ?? this.services,
        id: id ?? this.id,
        email: email ?? this.email,
        role: role ?? this.role,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        gender: gender ?? this.gender,
        birthday: birthday ?? this.birthday,
        avatar: avatar ?? this.avatar,
        postal: postal ?? this.postal,
        address: address ?? this.address,
        companyName: companyName ?? this.companyName,
        companyContact: companyContact ?? this.companyContact,
        delivery: delivery ?? this.delivery,
        addressManual: addressManual ?? this.addressManual,
        typeLogin: typeLogin ?? this.typeLogin,
        introduction: introduction ?? this.introduction,
        status: status ?? this.status,
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
        price: price ?? this.price,
        bankAccountHolder: bankAccountHolder ?? this.bankAccountHolder,
        bankName: bankName ?? this.bankName,
        bankNumberAccount: bankNumberAccount ?? this.bankNumberAccount,
        appealCount: appealCount ?? this.appealCount,
        isDeletedByUser: isDeletedByUser ?? this.isDeletedByUser,
        region: region ?? this.region,
        provinceInfo: provinceInfo ?? this.provinceInfo,
        districtInfo: districtInfo ?? this.districtInfo,
        portfolioInfo: portfolioInfo ?? this.portfolioInfo,
        service: service ?? this.service,
        userCategories: userCategories ?? this.userCategories,
        userHashtags: userHashtags ?? this.userHashtags,
        bankImage: bankImage ?? this.bankImage,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        services: json["services"],
        id: json["id"],
        email: json["email"],
        role: json["role"],
        name: json["name"],
        phone: json["phone"],
        password: json["password"],
        gender: json["gender"],
        birthday: json["birthday"],
        avatar: json["avatar"],
        postal: json["postal"],
        address: json["address"],
        companyName: json["companyName"],
        companyContact: json["companyContact"],
        delivery: json["delivery"],
        addressManual: json["addressManual"],
        typeLogin: json["typeLogin"],
        introduction: json["introduction"],
        status: json["status"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        price: json["price"],
        bankAccountHolder: json["bankAccountHolder"],
        bankName: json["bankName"],
        bankNumberAccount: json["bankNumberAccount"],
        appealCount: json["appealCount"],
        isDeletedByUser: json["isDeletedByUser"],
        region: json["region"],
        provinceInfo: json["provinceInfo"],
        districtInfo: json["districtInfo"],
        portfolioInfo: List<dynamic>.from(json["portfolioInfo"].map((x) => x)),
        service: json["service"],
        userCategories: List<dynamic>.from(json["userCategories"].map((x) => x)),
        userHashtags: List<dynamic>.from(json["userHashtags"].map((x) => x)),
        bankImage: json["bankImage"],
      );

  Map<String, dynamic> toJson() => {
        "services": services,
        "id": id,
        "email": email,
        "role": role,
        "name": name,
        "phone": phone,
        "password": password,
        "gender": gender,
        "birthday": birthday,
        "avatar": avatar,
        "postal": postal,
        "address": address,
        "companyName": companyName,
        "companyContact": companyContact,
        "delivery": delivery,
        "addressManual": addressManual,
        "typeLogin": typeLogin,
        "introduction": introduction,
        "status": status,
        "longitude": longitude,
        "latitude": latitude,
        "price": price,
        "bankAccountHolder": bankAccountHolder,
        "bankName": bankName,
        "bankNumberAccount": bankNumberAccount,
        "appealCount": appealCount,
        "isDeletedByUser": isDeletedByUser,
        "region": region,
        "provinceInfo": provinceInfo,
        "districtInfo": districtInfo,
        "portfolioInfo": List<dynamic>.from(portfolioInfo.map((x) => x)),
        "service": service,
        "userCategories": List<dynamic>.from(userCategories.map((x) => x)),
        "userHashtags": List<dynamic>.from(userHashtags.map((x) => x)),
        "bankImage": bankImage,
      };
}
