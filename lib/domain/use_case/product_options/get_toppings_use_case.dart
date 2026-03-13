import 'package:hungry_app/domain/entities/product_options/product_options_entity.dart';
import 'package:hungry_app/domain/repositories/product_options/product_options_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetToppingsUseCase {
  final ProductOptionsRepo optionsRepo;
  GetToppingsUseCase(this.optionsRepo);
  Future<List<OptionEntity>> call() {
    return optionsRepo.getToppings();
  }
}
