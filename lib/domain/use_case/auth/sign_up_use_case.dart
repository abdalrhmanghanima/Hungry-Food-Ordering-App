import 'package:hungry_app/domain/entities/auth/auth_entity.dart';
import 'package:hungry_app/domain/repositories/auth/auth_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class SignUpUseCase {
  final AuthRepo repository;

  SignUpUseCase(this.repository);

  Future<AuthEntity> call({
    required String name,
    required String email,
    required String password,
    required String phone,
    XFile? image,
  }) {
    return repository.signUp(
      name: name,
      email: email,
      password: password,
      phone: phone,
      image: image,
    );
  }
}
