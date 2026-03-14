import 'package:hungry_app/domain/entities/auth/auth_entity.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {
  final AuthEntity authEntity;

  SignUpSuccess(this.authEntity);
}

class SignUpError extends AuthState {
  final String message;

  SignUpError(this.message);
}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final AuthEntity authEntity;

  LoginSuccess(this.authEntity);
}

class LoginError extends AuthState {
  final String message;

  LoginError(this.message);
}
