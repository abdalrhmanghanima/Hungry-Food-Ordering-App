// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hungry_app/domain/entities/cart/cart_entity.dart';
// import 'package:hungry_app/domain/entities/home/categories_entity.dart';
// import 'package:hungry_app/domain/entities/home/products_entity.dart';
// import 'package:hungry_app/domain/entities/product_options/product_options_entity.dart';
// import 'package:hungry_app/domain/use_case/cart/get_cart_use_case.dart';
// import 'package:hungry_app/domain/use_case/home/get_categories_use_case.dart';
// import 'package:hungry_app/domain/use_case/home/get_products_use_case.dart';
// import 'package:hungry_app/domain/use_case/product_options/get_side_options_use_case.dart';
// import 'package:hungry_app/domain/use_case/product_options/get_toppings_use_case.dart';
// import 'package:hungry_app/features/root/cubit/app_states.dart';
// import 'package:injectable/injectable.dart';
//
// @injectable
// class AppCubit extends Cubit<AppState> {
//   final GetProductsUseCase getProductsUseCase;
//   final GetCategoriesUseCase getCategoriesUseCase;
//   final GetCartUseCase getCartUseCase;
//   final GetToppingsUseCase toppingsUseCase;
//   final GetSideOptionsUseCase sideOptionsUseCase;
//
//   AppCubit(
//       this.getProductsUseCase,
//       this.getCartUseCase,
//       this.getCategoriesUseCase,
//       this.sideOptionsUseCase,
//       this.toppingsUseCase,
//       ) : super(AppInitial());
//
//   Future<void> loadAppData() async {
//     emit(AppLoading());
//
//     try {
//
//       final results = await Future.wait([
//         getProductsUseCase(),
//         getCartUseCase(),
//         getCategoriesUseCase(),
//         toppingsUseCase(),
//         sideOptionsUseCase(),
//       ]);
//
//       final products = results[0] as ProductsEntity;
//       final cart = results[1] as List<CartEntity>;
//       final categories = results[2] as CategoriesEntity;
//       final toppings = results[3] as List<OptionEntity>;
//       final sideOptions = results[4] as List<OptionEntity>;
//
//       emit(
//         AppLoaded(
//           products: products.data!,
//           cart: cart,
//           categories: categories.data!,
//           toppings: toppings,
//           sideOptions: sideOptions,
//         ),
//       );
//
//     } catch (e) {
//       emit(AppError(e.toString()));
//     }
//   }
// }