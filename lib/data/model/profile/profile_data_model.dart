import 'package:hungry_app/domain/entities/profile/profile_entity.dart';

class ProfileDataModel extends ProfileEntity {
  ProfileDataModel({
    required super.name,
    required super.email,
    required super.image,
    super.address,
    super.visa,
  });

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) {
    return ProfileDataModel(
      name: json['name'],
      email: json['email'],
      image: json['image'],
      address: json['address'],
      visa: json['visa'],
    );
  }
}