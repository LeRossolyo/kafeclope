// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:kafeclope/config/app_router.dart' as _i3;
import 'package:kafeclope/injections/module/app.module.dart' as _i8;
import 'package:kafeclope/services/auth.service.dart' as _i7;
import 'package:kafeclope/services/firebase.service.dart' as _i6;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.AppRouter>(() => appModule.appRouter);
    gh.factory<_i4.FirebaseAuth>(() => appModule.auth);
    gh.factory<_i5.FirebaseFirestore>(() => appModule.store);
    await gh.factoryAsync<_i6.FirebaseService>(
      () => appModule.fireService,
      preResolve: true,
    );
    gh.singleton<_i7.AuthService>(
        _i7.AuthService.inject(gh<_i4.FirebaseAuth>()));
    return this;
  }
}

class _$AppModule extends _i8.AppModule {}
