import 'package:hungry_app/data/model/cart/order_details_model.dart';

abstract class CartRemoteDataSource {
  Future<void> addToCart({
    required int productId,
    required int quantity,
    required double spicy,
    required List<int> toppings,
    required List<int> sides,
  });

  Future<OrderDetailsModel> getCart();

  Future<void> deleteCartItem(int itemId);
}
