import 'package:hungry_app/domain/entities/auth/auth_entity.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final AuthEntity authEntity;

  LoginSuccess(this.authEntity);
}

class SignUpSuccess extends AuthState {
  final AuthEntity authEntity;

  SignUpSuccess(this.authEntity);
}

class AuthLoggedOut extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}