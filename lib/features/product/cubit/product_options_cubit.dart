import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/domain/use_case/product_options/get_side_options_use_case.dart';
import 'package:hungry_app/domain/use_case/product_options/get_toppings_use_case.dart';
import 'package:hungry_app/features/product/cubit/product_options_state.dart';
import 'package:injectable/injectable.dart';
@injectable
class ProductOptionsCubit extends Cubit<ProductOptionsState> {
  GetSideOptionsUseCase sideOptionsUseCase;
  GetToppingsUseCase toppingsUseCase;
  ProductOptionsCubit(this.toppingsUseCase, this.sideOptionsUseCase)
    : super(ProductOptionsInitial());
  Future<void> getProductOptions() async {
    emit(ProductOptionsLoading());
    try {
      final sides = await sideOptionsUseCase();
      final toppings = await toppingsUseCase();
      emit(ProductOptionsSuccess(toppings: toppings, sides: sides));
    } catch (e) {
      emit(ProductOptionsError(e.toString()));
    }
  }
}
