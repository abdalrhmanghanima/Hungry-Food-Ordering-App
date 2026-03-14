import 'package:hungry_app/domain/entities/home/categories_entity.dart';
import 'package:hungry_app/domain/repositories/home/home_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCategoriesUseCase {
  HomeRepo homeRepo;
  GetCategoriesUseCase(this.homeRepo);
  Future<CategoriesEntity> call() {
    return homeRepo.getCategories();
  }
}
