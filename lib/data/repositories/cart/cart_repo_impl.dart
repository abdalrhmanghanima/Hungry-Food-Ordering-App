import 'package:hungry_app/data/data_source/cart/cart_remote_data_source.dart';
import 'package:hungry_app/domain/entities/cart/cart_entity.dart';
import 'package:hungry_app/domain/repositories/cart/cart_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;

  CartRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> addToCart({
    required int productId,
    required int quantity,
    required double spicy,
    required List<int> toppings,
    required List<int> sides,
  }) async {
    await remoteDataSource.addToCart(
      productId: productId,
      quantity: quantity,
      spicy: spicy,
      toppings: toppings,
      sides: sides,
    );
  }

  @override
  Future<List<CartEntity>> getCart() async {
    final response = await remoteDataSource.getCart();

    final items = response.data?.items ?? [];

    return items.map((item) {
      return CartEntity(
        id: item.itemId ?? 0,
        productId: item.productId ?? 0,
        name: item.name ?? '',
        image: item.image ?? '',
        quantity: item.quantity ?? 0,
        price: double.tryParse(item.price?.toString() ?? '0') ?? 0,
        spicy: double.tryParse(item.spicy?.toString() ?? '0') ?? 0,
        toppings: item.toppings?.map((e) => e.name ?? '').toList() ?? [],
        sides: item.sideOptions?.map((e) => e.name ?? '').toList() ?? [],
      );
    }).toList();
  }

  @override
  Future<void> deleteCartItem(int cartItemId) async {
    await remoteDataSource.deleteCartItem(cartItemId);
  }
}
