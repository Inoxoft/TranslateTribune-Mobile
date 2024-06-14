// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:translatetribune/src/configs/modules/app_modules.dart' as _i11;
import 'package:translatetribune/src/configs/router/app_router.dart' as _i3;
import 'package:translatetribune/src/data/database/app_database.dart' as _i4;
import 'package:translatetribune/src/data/database/daos/saved_articles_dao.dart'
    as _i7;
import 'package:translatetribune/src/data/database/daos/settings_dao.dart'
    as _i8;
import 'package:translatetribune/src/data/services/articles.dart' as _i5;
import 'package:translatetribune/src/data/services/language.dart' as _i9;
import 'package:translatetribune/src/data/services/notifications.dart' as _i6;
import 'package:translatetribune/src/data/services/saved_articles.dart' as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModules = _$AppModules();
    gh.singleton<_i3.AppRouter>(() => appModules.router);
    gh.singleton<_i4.AppDatabase>(() => _i4.AppDatabase());
    gh.lazySingleton<_i5.ArticlesService>(() => _i5.ArticlesService());
    gh.lazySingleton<_i6.NotificationsService>(
        () => _i6.NotificationsService());
    gh.lazySingleton<_i7.SavedArticlesDao>(
        () => _i7.SavedArticlesDao(gh<_i4.AppDatabase>()));
    gh.lazySingleton<_i8.SettingsDao>(
        () => _i8.SettingsDao(gh<_i4.AppDatabase>()));
    gh.lazySingleton<_i9.LanguagesService>(
        () => _i9.LanguagesService(gh<_i8.SettingsDao>()));
    gh.lazySingleton<_i10.SavedArticlesService>(
        () => _i10.SavedArticlesService(gh<_i7.SavedArticlesDao>()));
    return this;
  }
}

class _$AppModules extends _i11.AppModules {}
