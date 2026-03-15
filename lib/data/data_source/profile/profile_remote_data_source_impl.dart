import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hungry_app/core/constants/api_endpoints.dart';
import 'package:hungry_app/data/data_source/profile/profile_remote_data_source.dart';
import 'package:hungry_app/data/model/profile/profile_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio dio;
  ProfileRemoteDataSourceImpl(this.dio);
  @override
  Future<ProfileModel> getProfile() async {
    final response = await dio.get(ApiConstants.profile);
    return ProfileModel.fromJson(response.data);
  }
  @override
  Future<ProfileModel> updateProfile({
    required String name,
    required String email,
    required String address,
    File? image,
  }) async {

    FormData formData = FormData.fromMap({
      "name": name,
      "email": email,
      "address": address,
      if (image != null)
        "image": await MultipartFile.fromFile(image.path),
    });

    final response = await dio.post(
      ApiConstants.updateProfile,
      data: formData,
    );

    return ProfileModel.fromJson(response.data);
  }
}
