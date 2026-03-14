import 'package:hungry_app/domain/entities/cart/cart_entity.dart';

abstract class CartRepository {
  Future<void> addToCart({
    required int productId,
    required int quantity,
    required double spicy,
    required List<int> toppings,
    required List<int> sides,
  });

  Future<List<CartEntity>> getCart();

  Future<void> deleteCartItem(int itemId);
}
