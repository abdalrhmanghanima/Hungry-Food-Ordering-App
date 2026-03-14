import 'package:hungry_app/domain/entities/product_options/product_options_entity.dart';

abstract class ProductOptionsRepo {
  Future<List<OptionEntity>> getToppings();
  Future<List<OptionEntity>> getSideOptions();
}
