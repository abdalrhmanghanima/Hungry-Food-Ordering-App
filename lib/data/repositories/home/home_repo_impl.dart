import 'package:hungry_app/data/data_source/home/home_remote_data_source.dart';
import 'package:hungry_app/domain/entities/home/categories_entity.dart';
import 'package:hungry_app/domain/entities/home/products_entity.dart';
import 'package:hungry_app/domain/repositories/home/home_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl(this.homeRemoteDataSource);
  @override
  Future<CategoriesEntity> getCategories() async {
    final categories = await homeRemoteDataSource.getCategories();
    return categories;
  }

  @override
  Future<ProductsEntity> getProducts() async {
    final products = await homeRemoteDataSource.getProducts();
    return products;
  }
}
