import 'package:hungry_app/data/model/profile/profile_data_model.dart';
import '../../../domain/entities/profile/profile_response_entity.dart';

class ProfileModel extends ProfileResponseEntity {
  ProfileModel({
    required super.code,
    required super.message,
    required super.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      code: json['code'],
      message: json['message'],
      data: ProfileDataModel.fromJson(json['data']),
    );
  }
}