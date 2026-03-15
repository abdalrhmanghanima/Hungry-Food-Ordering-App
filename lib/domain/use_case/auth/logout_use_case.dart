import 'package:injectable/injectable.dart';
import '../../repositories/auth/auth_repo.dart';

@injectable
class LogoutUseCase {

  final AuthRepo repo;

  LogoutUseCase(this.repo);

  Future<void> call() {
    return repo.logout();
  }

}