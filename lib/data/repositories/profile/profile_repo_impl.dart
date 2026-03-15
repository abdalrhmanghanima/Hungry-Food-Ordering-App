import 'dart:io';

import 'package:hungry_app/data/data_source/profile/profile_remote_data_source.dart';
import 'package:hungry_app/domain/entities/profile/profile_entity.dart';
import 'package:hungry_app/domain/repositories/profile/profile_repo.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo{
  final ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepoImpl(this.profileRemoteDataSource);
  @override
  Future<ProfileEntity> getProfile() async{
    final result = await profileRemoteDataSource.getProfile();
    return result.data;
  }
  @override
  Future<ProfileEntity> updateProfile({
    required String name,
    required String email,
    required String address,
    File? image,
  }) async {

    final result = await profileRemoteDataSource.updateProfile(
      name: name,
      email: email,
      address: address,
      image: image,
    );

    return result.data;
  }
}