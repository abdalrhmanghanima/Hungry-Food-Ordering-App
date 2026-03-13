import 'package:hungry_app/domain/entities/home/categories_entity.dart';
import 'package:hungry_app/domain/entities/home/products_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final CategoriesEntity categories;
  final ProductsEntity products;

  HomeLoaded({
    required this.categories,
    required this.products,
  });
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}