import 'package:dio/dio.dart';
import 'package:hungry_app/core/constants/api_endpoints.dart';
import 'package:hungry_app/data/data_source/auth/auth_remote_data_source.dart';
import 'package:hungry_app/data/model/auth/auth_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;
  AuthRemoteDataSourceImpl(this.dio);
  @override
  Future<AuthModel> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    XFile? image,
  }) async {
    final formData = FormData.fromMap({
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      if (image != null) "image": await MultipartFile.fromFile(image.path),
    });

    print(ApiConstants.register);

    final response = await dio.post(ApiConstants.register, data: formData);
    print(response.data);
    if (response.data is Map<String, dynamic>) {
      return AuthModel.fromJson(response.data);
    } else {
      throw Exception("Invalid server response");
    }
  }

  @override
  Future<AuthModel> login({
    required String email,
    required String password,
    XFile? image,
  }) async {
    final response = await dio.post(
      ApiConstants.login,
      data: {"email": email, "password": password},
    );
    print(response.data);
    if (response.data is Map<String, dynamic>) {
      return AuthModel.fromJson(response.data);
    } else {
      throw Exception("Invalid server response");
    }
  }
  @override
  Future<void> logout() async {
    await dio.post(ApiConstants.logOut);
  }
}
