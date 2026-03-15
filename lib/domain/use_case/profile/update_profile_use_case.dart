import 'dart:io';

import 'package:hungry_app/domain/entities/profile/profile_entity.dart';
import 'package:hungry_app/domain/repositories/profile/profile_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class UpdateProfileUseCase {

  final ProfileRepo repo;

  UpdateProfileUseCase(this.repo);

  Future<ProfileEntity> call({
    required String name,
    required String email,
    required String address,
    File? image,
  }) {
    return repo.updateProfile(
      name: name,
      email: email,
      address: address,
      image: image,
    );
  }
}