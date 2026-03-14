import 'package:hungry_app/data/data_source/auth/auth_local_data_source.dart';
import 'package:hungry_app/data/data_source/auth/auth_remote_data_source.dart';
import 'package:hungry_app/domain/entities/auth/auth_entity.dart';
import 'package:hungry_app/domain/repositories/auth/auth_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource localDataSource;
  AuthRepoImpl(this.authRemoteDataSource, this.localDataSource);
  @override
  Future<AuthEntity> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    XFile? image,
  }) {
    return authRemoteDataSource.signUp(
      name: name,
      email: email,
      password: password,
      phone: phone,
      image: image,
    );
  }

  @override
  Future<AuthEntity> login({
    required String email,
    required String password,
    XFile? image,
  }) async {
    final result = await authRemoteDataSource.login(
      email: email,
      password: password,
      image: image,
    );

    await localDataSource.saveToken(result.data!.token!);

    return result;
  }
}
