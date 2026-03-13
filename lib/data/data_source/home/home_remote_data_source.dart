import 'package:hungry_app/data/model/home/categories_model.dart';
import 'package:hungry_app/data/model/home/products_model.dart';

abstract class HomeRemoteDataSource {
  Future<CategoriesModel> getCategories();
  Future<ProductsModel> getProducts();
}
