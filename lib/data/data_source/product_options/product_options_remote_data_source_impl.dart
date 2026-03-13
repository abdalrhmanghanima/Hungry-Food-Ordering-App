import 'package:dio/dio.dart';
import 'package:hungry_app/core/constants/api_endpoints.dart';
import 'package:hungry_app/data/data_source/product_options/product_options_remote_data_source.dart';
import 'package:hungry_app/data/model/product_options/side_options_model.dart';
import 'package:hungry_app/data/model/product_options/toppings_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductOptionsRemoteDataSource)
class ProductOptionsRemoteDataSourceImpl
    implements ProductOptionsRemoteDataSource {
  final Dio dio;
  ProductOptionsRemoteDataSourceImpl(this.dio);
  @override
  Future<ToppingsModel> getToppings() async {
    final response = await dio.get(ApiConstants.toppings);
    return ToppingsModel.fromJson(response.data);
  }

  @override
  Future<SideOptionsModel> getSideOptions() async {
    final response = await dio.get(ApiConstants.sideOptions);
    return SideOptionsModel.fromJson(response.data);
  }
}
