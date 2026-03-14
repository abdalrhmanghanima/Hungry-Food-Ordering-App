import 'package:dio/dio.dart';
import 'package:hungry_app/core/constants/api_endpoints.dart';
import 'package:hungry_app/data/data_source/home/home_remote_data_source.dart';
import 'package:hungry_app/data/model/home/categories_model.dart';
import 'package:hungry_app/data/model/home/products_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;
  HomeRemoteDataSourceImpl(this.dio);
  @override
  Future<CategoriesModel> getCategories() async {
    final response = await dio.get(ApiConstants.categories);
    return CategoriesModel.fromJson(response.data);
  }

  @override
  Future<ProductsModel> getProducts() async {
    final response = await dio.get(ApiConstants.products);
    return ProductsModel.fromJson(response.data);
  }
}
