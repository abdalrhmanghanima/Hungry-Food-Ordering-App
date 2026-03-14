import 'package:hungry_app/data/model/auth/auth_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    XFile? image,
  });
  Future<AuthModel> login({
    required String email,
    required String password,
    XFile? image,
  });
}
