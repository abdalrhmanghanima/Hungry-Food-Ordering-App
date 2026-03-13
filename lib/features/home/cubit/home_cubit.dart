import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/domain/use_case/home/get_categories_use_case.dart';
import 'package:hungry_app/domain/use_case/home/get_products_use_case.dart';
import 'package:hungry_app/features/home/cubit/home_states.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeCubit extends Cubit<HomeState>{
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetProductsUseCase getProductsUseCase;
  HomeCubit(this.getProductsUseCase,this.getCategoriesUseCase): super(HomeInitial());

  Future<void> loadHomeData() async {
    emit(HomeLoading());

    final categories = await getCategoriesUseCase();
    final products = await getProductsUseCase();

    emit(HomeLoaded(
      categories: categories,
      products: products,
    ));
  }

}