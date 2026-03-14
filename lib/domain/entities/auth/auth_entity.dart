class AuthEntity {
  final String? code;
  final String? message;
  final DataEntity? data;

  AuthEntity({this.code, this.message, this.data});
}

class DataEntity {
  final String? token;
  final String? name;
  final String? email;
  final String? image;

  DataEntity({this.token, this.name, this.email, this.image});
}
