import 'package:hungry_app/domain/entities/product_options/product_options_entity.dart';

abstract class ProductOptionsState {}

class ProductOptionsInitial extends ProductOptionsState {}

class ProductOptionsLoading extends ProductOptionsState {}

class ProductOptionsSuccess extends ProductOptionsState {
  final List<OptionEntity> toppings;
  final List<OptionEntity> sides;

  ProductOptionsSuccess({
    required this.toppings,
    required this.sides,
  });
}

class ProductOptionsError extends ProductOptionsState {
  final String message;

  ProductOptionsError(this.message);
}