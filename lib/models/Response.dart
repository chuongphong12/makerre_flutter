class ApiResponse<T> {
  ApiResponse({
    this.code,
    this.success,
    this.message,
    this.data,
  });

  ApiResponse.fromJson(dynamic json) {
    code = json['code'];
    success = json['success'];
    message = json['message'];
    data = json['data'] ?? json['data'];
  }

  String? code;
  bool? success;
  String? message;
  T? data;
}
