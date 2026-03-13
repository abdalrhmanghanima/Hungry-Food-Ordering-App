import 'package:hungry_app/domain/entities/auth/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    String? code,
    String? message,
    DataModel? data,
  }) : super(
    code: code,
    message: message,
    data: data,
  );

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      code: json['code']?.toString(),
      message: json['message'],
      data: json['data'] != null
          ? DataModel.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
      "data": data != null ? (data as DataModel).toJson() : null,
    };
  }
}

class DataModel extends DataEntity {
  DataModel({
    String? token,
    String? name,
    String? email,
    String? image,
  }) : super(
    token: token,
    name: name,
    email: email,
    image: image,
  );

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      token: json['token'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "name": name,
      "email": email,
      "image": image,
    };
  }
}