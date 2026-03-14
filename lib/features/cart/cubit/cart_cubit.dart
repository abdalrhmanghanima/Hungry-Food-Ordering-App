import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/domain/use_case/cart/add_to_cart_use_case.dart';
import 'package:hungry_app/domain/use_case/cart/get_cart_use_case.dart';
import 'package:hungry_app/domain/use_case/cart/delete_cart_item_use_case.dart';
import 'package:hungry_app/features/cart/cubit/cart_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final AddToCartUseCase addToCartUseCase;
  final GetCartUseCase getCartUseCase;
  final DeleteCartItemUseCase deleteCartItemUseCase;

  CartCubit(
    this.addToCartUseCase,
    this.getCartUseCase,
    this.deleteCartItemUseCase,
  ) : super(CartInitial());

  Future<void> getCart() async {
    emit(CartLoading());

    try {
      final cart = await getCartUseCase();

      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> addToCart({
    required int productId,
    required int quantity,
    required double spicy,
    required List<int> toppings,
    required List<int> sides,
  }) async {
    emit(CartLoading());

    try {
      await addToCartUseCase(
        productId: productId,
        quantity: quantity,
        spicy: spicy,
        toppings: toppings,
        sides: sides,
      );

      emit(CartAddSuccess());

      await getCart();
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> deleteItem(int itemId) async {
    emit(CartLoading());

    try {
      await deleteCartItemUseCase(itemId);

      emit(CartDeleteSuccess());

      await getCart();
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }
}
