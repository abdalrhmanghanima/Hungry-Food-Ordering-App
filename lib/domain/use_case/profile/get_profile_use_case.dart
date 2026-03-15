import 'package:hungry_app/domain/entities/profile/profile_entity.dart';
import 'package:hungry_app/domain/repositories/profile/profile_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetProfileUseCase {
  final ProfileRepo repository;

  GetProfileUseCase(this.repository);

  Future<ProfileEntity> call() {
    return repository.getProfile();
  }
}