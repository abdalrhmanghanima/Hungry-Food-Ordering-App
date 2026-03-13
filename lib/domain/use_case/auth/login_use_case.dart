import 'package:hungry_app/domain/entities/auth/auth_entity.dart';
import 'package:hungry_app/domain/repositories/auth/auth_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class LogInUseCase {
  final AuthRepo repository;

  LogInUseCase(this.repository);

  Future<AuthEntity> call({
    required String email,
    required String password,
    XFile? image,
  }) {
    return repository.login(
      email: email,
      password: password,
      image: image,
    );
  }
}
