// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hungry_app/core/network/network_module.dart' as _i434;
import 'package:hungry_app/data/data_source/auth/auth_local_data_source.dart'
    as _i817;
import 'package:hungry_app/data/data_source/auth/auth_local_data_source_impl.dart'
    as _i767;
import 'package:hungry_app/data/data_source/auth/auth_remote_data_source.dart'
    as _i1008;
import 'package:hungry_app/data/data_source/auth/auth_remote_data_source_impl.dart'
    as _i1063;
import 'package:hungry_app/data/data_source/home/home_remote_data_source.dart'
    as _i692;
import 'package:hungry_app/data/data_source/home/home_remote_data_source_impl.dart'
    as _i266;
import 'package:hungry_app/data/data_source/product_options/product_options_remote_data_source.dart'
    as _i829;
import 'package:hungry_app/data/data_source/product_options/product_options_remote_data_source_impl.dart'
    as _i762;
import 'package:hungry_app/data/repositories/auth/auth_repo_impl.dart' as _i952;
import 'package:hungry_app/data/repositories/home/home_repo_impl.dart' as _i780;
import 'package:hungry_app/data/repositories/product_options/product_options_repo_impl.dart'
    as _i697;
import 'package:hungry_app/domain/repositories/auth/auth_repo.dart' as _i870;
import 'package:hungry_app/domain/repositories/home/home_repo.dart' as _i777;
import 'package:hungry_app/domain/repositories/product_options/product_options_repo.dart'
    as _i890;
import 'package:hungry_app/domain/use_case/auth/login_use_case.dart' as _i938;
import 'package:hungry_app/domain/use_case/auth/sign_up_use_case.dart' as _i343;
import 'package:hungry_app/domain/use_case/home/get_categories_use_case.dart'
    as _i196;
import 'package:hungry_app/domain/use_case/home/get_products_use_case.dart'
    as _i723;
import 'package:hungry_app/domain/use_case/product_options/get_side_options_use_case.dart'
    as _i599;
import 'package:hungry_app/domain/use_case/product_options/get_toppings_use_case.dart'
    as _i765;
import 'package:hungry_app/features/auth/cubit/auth_cubit.dart' as _i679;
import 'package:hungry_app/features/home/cubit/home_cubit.dart' as _i505;
import 'package:hungry_app/features/product/cubit/product_options_cubit.dart'
    as _i819;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio());
    gh.lazySingleton<_i829.ProductOptionsRemoteDataSource>(
      () => _i762.ProductOptionsRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i817.AuthLocalDataSource>(
      () => _i767.AuthLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i692.HomeRemoteDataSource>(
      () => _i266.HomeRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i890.ProductOptionsRepo>(
      () => _i697.ProductOptionsRepoImpl(
        gh<_i829.ProductOptionsRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i599.GetSideOptionsUseCase>(
      () => _i599.GetSideOptionsUseCase(gh<_i890.ProductOptionsRepo>()),
    );
    gh.lazySingleton<_i765.GetToppingsUseCase>(
      () => _i765.GetToppingsUseCase(gh<_i890.ProductOptionsRepo>()),
    );
    gh.lazySingleton<_i1008.AuthRemoteDataSource>(
      () => _i1063.AuthRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i777.HomeRepo>(
      () => _i780.HomeRepoImpl(gh<_i692.HomeRemoteDataSource>()),
    );
    gh.lazySingleton<_i870.AuthRepo>(
      () => _i952.AuthRepoImpl(
        gh<_i1008.AuthRemoteDataSource>(),
        gh<_i817.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i196.GetCategoriesUseCase>(
      () => _i196.GetCategoriesUseCase(gh<_i777.HomeRepo>()),
    );
    gh.lazySingleton<_i723.GetProductsUseCase>(
      () => _i723.GetProductsUseCase(gh<_i777.HomeRepo>()),
    );
    gh.lazySingleton<_i938.LogInUseCase>(
      () => _i938.LogInUseCase(gh<_i870.AuthRepo>()),
    );
    gh.lazySingleton<_i343.SignUpUseCase>(
      () => _i343.SignUpUseCase(gh<_i870.AuthRepo>()),
    );
    gh.factory<_i819.ProductOptionsCubit>(
      () => _i819.ProductOptionsCubit(
        gh<_i765.GetToppingsUseCase>(),
        gh<_i599.GetSideOptionsUseCase>(),
      ),
    );
    gh.factory<_i679.AuthCubit>(
      () =>
          _i679.AuthCubit(gh<_i343.SignUpUseCase>(), gh<_i938.LogInUseCase>()),
    );
    gh.factory<_i505.HomeCubit>(
      () => _i505.HomeCubit(
        gh<_i723.GetProductsUseCase>(),
        gh<_i196.GetCategoriesUseCase>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i434.NetworkModule {}
