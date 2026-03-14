import 'package:hungry_app/domain/repositories/cart/cart_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddToCartUseCase {
  final CartRepository repository;

  AddToCartUseCase(this.repository);

  Future<void> call({
    required int productId,
    required int quantity,
    required double spicy,
    required List<int> toppings,
    required List<int> sides,
  }) {
    return repository.addToCart(
      productId: productId,
      quantity: quantity,
      spicy: spicy,
      toppings: toppings,
      sides: sides,
    );
  }
}
