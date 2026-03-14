import 'package:hungry_app/data/model/product_options/side_options_model.dart';
import 'package:hungry_app/data/model/product_options/toppings_model.dart';

abstract class ProductOptionsRemoteDataSource {
  Future<ToppingsModel> getToppings();
  Future<SideOptionsModel> getSideOptions();
}
