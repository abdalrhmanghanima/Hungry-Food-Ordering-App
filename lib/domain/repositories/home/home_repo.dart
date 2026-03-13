import 'package:hungry_app/domain/entities/home/categories_entity.dart';
import 'package:hungry_app/domain/entities/home/products_entity.dart';

abstract class HomeRepo{
  Future<CategoriesEntity> getCategories();
  Future<ProductsEntity> getProducts();
}