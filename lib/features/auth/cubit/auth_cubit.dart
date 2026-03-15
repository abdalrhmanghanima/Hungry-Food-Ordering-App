import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/domain/use_case/auth/login_use_case.dart';
import 'package:hungry_app/domain/use_case/auth/sign_up_use_case.dart';
import 'package:hungry_app/features/auth/cubit/auth_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_case/auth/logout_use_case.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final SignUpUseCase signUpUseCase;
  final LogInUseCase logInUseCase;
  final LogoutUseCase logoutUseCase;
  AuthCubit(this.signUpUseCase, this.logInUseCase,this.logoutUseCase) : super(AuthInitial());
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    XFile? image,
  }) async {
    emit(AuthLoading());
    try {
      final result = await signUpUseCase(
        name: name,
        email: email,
        password: password,
        phone: phone,
        image: image,
      );

      emit(SignUpSuccess(result));
    } catch (e) {
      if (e is DioException) {
        String message = "Server error";

        final data = e.response?.data;

        if (data is Map && data["message"] != null) {
          message = data["message"].toString();
        }
        print(e.response?.data);
        emit(AuthError(message));
      } else {
        emit(AuthError(e.toString()));
      }
    }
  }

  Future<void> login({
    required String email,
    required String password,
    XFile? image,
  }) async {
    emit(AuthLoading());
    try {
      final result = await logInUseCase(email: email, password: password);

      emit(LoginSuccess(result));
    } catch (e) {
      if (e is DioException) {
        String message = "Server error";

        final data = e.response?.data;

        if (data is Map && data["message"] != null) {
          message = data["message"].toString();
        }
        print(e.response?.data);
        emit(AuthError(message));
      } else {
        emit(AuthError(e.toString()));
      }
    }
  }
  Future<void> logout() async {

    emit(AuthLoading());

    try {

      await logoutUseCase();

      emit(AuthLoggedOut());

    } catch (e) {

      emit(AuthError(e.toString()));

    }

  }
}
