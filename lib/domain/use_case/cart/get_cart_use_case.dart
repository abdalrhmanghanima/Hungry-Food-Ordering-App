import 'package:hungry_app/domain/entities/cart/cart_entity.dart';
import 'package:hungry_app/domain/repositories/cart/cart_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCartUseCase {
  final CartRepository repository;

  GetCartUseCase(this.repository);

  Future<List<CartEntity>> call() {
    return repository.getCart();
  }
}
