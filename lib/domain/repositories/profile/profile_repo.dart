import 'dart:io';

import 'package:hungry_app/domain/entities/profile/profile_entity.dart';

abstract class ProfileRepo{
  Future<ProfileEntity> getProfile();
  Future<ProfileEntity> updateProfile({
    required String name,
    required String email,
    required String address,
    File? image,
  });
}