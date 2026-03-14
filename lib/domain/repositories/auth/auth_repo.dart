import 'package:hungry_app/domain/entities/auth/auth_entity.dart';
import 'package:image_picker/image_picker.dart';

abstract class AuthRepo {
  Future<AuthEntity> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    XFile? image,
  });
  Future<AuthEntity> login({
    required String email,
    required String password,
    XFile? image,
  });
}
