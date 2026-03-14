import 'package:hungry_app/domain/entities/cart/cart_entity.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartEntity> cart;

  CartLoaded(this.cart);
}

class CartAddSuccess extends CartState {}

class CartDeleteSuccess extends CartState {}

class CartError extends CartState {
  final String message;

  CartError(this.message);
}
