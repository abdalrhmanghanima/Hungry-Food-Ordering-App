import 'package:hungry_app/domain/entities/home/products_entity.dart';
import 'package:hungry_app/domain/repositories/home/home_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProductsUseCase {
  HomeRepo homeRepo;
  GetProductsUseCase(this.homeRepo);
  Future<ProductsEntity> call() {
    return homeRepo.getProducts();
  }
}
