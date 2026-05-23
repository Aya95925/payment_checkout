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
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/checkout/data/data_source/remote_data_source.dart'
    as _i37;
import '../../feature/checkout/data/data_source/remote_data_source_impl.dart'
    as _i1057;
import '../../feature/checkout/data/repo/check_out_repo.dart' as _i23;
import '../../feature/checkout/data/repo/checkout_repo_impl.dart' as _i800;
import '../../feature/checkout/presentation/maneger/payment_cubit/payment_cubit.dart'
    as _i686;
import '../utils/api_service.dart' as _i849;
import '../utils/stripe_sevice.dart' as _i786;
import 'get_it_module.dart' as _i1015;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.singleton<_i361.Dio>(() => getItModule.createDio());
    gh.lazySingleton<_i849.ApiService>(() => _i849.ApiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i786.StripeSevice>(
      () => _i786.StripeSevice(gh<_i849.ApiService>()),
    );
    gh.factory<_i37.RemoteDataSource>(
      () => _i1057.RemoteDataSourceImpl(gh<_i786.StripeSevice>()),
    );
    gh.factory<_i23.CheckOutRepo>(
      () => _i800.CheckoutRepoImpl(gh<_i37.RemoteDataSource>()),
    );
    gh.factory<_i686.PaymentCubit>(
      () => _i686.PaymentCubit(gh<_i23.CheckOutRepo>()),
    );
    return this;
  }
}

class _$GetItModule extends _i1015.GetItModule {}
