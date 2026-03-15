import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/domain/use_case/profile/get_profile_use_case.dart';
import 'package:hungry_app/domain/use_case/profile/update_profile_use_case.dart';
import 'profile_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  ProfileCubit(this.getProfileUseCase,this.updateProfileUseCase) : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoading());

    try {
      final profile = await getProfileUseCase();
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String address,
    File? image,
  }) async {

    emit(ProfileLoading());

    try {

      final profile = await updateProfileUseCase(
        name: name,
        email: email,
        address: address,
        image: image,
      );

      emit(ProfileLoaded(profile));

    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}