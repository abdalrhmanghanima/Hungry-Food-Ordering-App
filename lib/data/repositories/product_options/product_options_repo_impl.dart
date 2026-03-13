import 'package:hungry_app/data/data_source/product_options/product_options_remote_data_source.dart';
import 'package:hungry_app/domain/entities/product_options/product_options_entity.dart';
import 'package:hungry_app/domain/repositories/product_options/product_options_repo.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: ProductOptionsRepo)
class ProductOptionsRepoImpl implements ProductOptionsRepo{
 ProductOptionsRemoteDataSource optionsRemoteDataSource;
 ProductOptionsRepoImpl(this.optionsRemoteDataSource);
 @override
  Future<List<OptionEntity>> getToppings() async{
   final toppings = await optionsRemoteDataSource.getToppings();
   return toppings.data!.map((e)=>e.toEntity()).toList();
  }
  @override
  Future<List<OptionEntity>> getSideOptions()async {
    final sideOptions = await optionsRemoteDataSource.getSideOptions();
    return sideOptions.data!.map((e)=>e.toEntity()).toList();
  }
}