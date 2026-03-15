import 'dart:io';

import 'package:hungry_app/data/model/profile/profile_model.dart';

abstract class ProfileRemoteDataSource{
  Future<ProfileModel> getProfile();
  Future<ProfileModel> updateProfile({
    required String name,
    required String email,
    required String address,
    File? image,
  });
}