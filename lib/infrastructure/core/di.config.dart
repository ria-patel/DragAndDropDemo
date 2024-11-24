// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_demo/application/auth/login/login_bloc.dart' as _i336;
import 'package:app_demo/application/home/home_bloc.dart' as _i756;
import 'package:app_demo/domain/auth/auth.repository.dart' as _i513;
import 'package:app_demo/domain/settings/settings.repository.dart' as _i217;
import 'package:app_demo/infrastructure/auth/i_auth.repository.dart' as _i388;
import 'package:app_demo/infrastructure/core/injectable_module.dart' as _i558;
import 'package:app_demo/infrastructure/settings/i_settings.repository.dart'
    as _i901;
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i974.FirebaseFirestore>(() => injectableModule.firestore);
    gh.lazySingleton<String>(() => injectableModule.apiBaseUrl);
    gh.lazySingleton<_i217.SettingsRepository>(
        () => _i901.ISettingsRepository(gh<_i974.FirebaseFirestore>()));
    gh.lazySingleton<_i513.AuthRepository>(
        () => _i388.IAuthRepository(gh<String>()));
    gh.factory<_i336.LoginBloc>(
        () => _i336.LoginBloc(gh<_i513.AuthRepository>()));
    gh.factory<_i756.HomeBloc>(
        () => _i756.HomeBloc(gh<_i217.SettingsRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i558.InjectableModule {}
