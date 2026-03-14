import 'package:hungry_app/domain/repositories/cart/cart_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteCartItemUseCase {
  final CartRepository repository;

  DeleteCartItemUseCase(this.repository);

  Future<void> call(int cartId) {
    return repository.deleteCartItem(cartId);
  }
}
