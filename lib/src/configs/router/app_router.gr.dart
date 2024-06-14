// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i13;
import 'package:translatetribune/src/data/models/article.dart' as _i12;
import 'package:translatetribune/src/presentation/pages/article_page.dart'
    as _i1;
import 'package:translatetribune/src/presentation/pages/articles_page.dart'
    as _i2;
import 'package:translatetribune/src/presentation/pages/games/nanogram/nanogram_page.dart'
    as _i5;
import 'package:translatetribune/src/presentation/pages/games/slide_puzzle/slide_puzzle_page.dart'
    as _i8;
import 'package:translatetribune/src/presentation/pages/games_page.dart' as _i3;
import 'package:translatetribune/src/presentation/pages/home_page.dart' as _i4;
import 'package:translatetribune/src/presentation/pages/saved_articles_page.dart'
    as _i6;
import 'package:translatetribune/src/presentation/pages/settings_page.dart'
    as _i7;
import 'package:translatetribune/src/presentation/pages/splash_screen.dart'
    as _i9;
import 'package:translatetribune/src/presentation/pages/welcome_page.dart'
    as _i10;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    ArticleRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ArticlePage(
          args.article,
          key: args.key,
        ),
      );
    },
    ArticlesRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ArticlesPage(),
      );
    },
    GamesRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.GamesPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    NonogramRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.NonogramPage(),
      );
    },
    SavedArticlesRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SavedArticlesPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsRouteArgs>(
          orElse: () => const SettingsRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.SettingsPage(key: args.key),
      );
    },
    SlidePuzzleRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.SlidePuzzlePage(),
      );
    },
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.SplashScreen(key: args.key),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.WelcomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ArticlePage]
class ArticleRoute extends _i11.PageRouteInfo<ArticleRouteArgs> {
  ArticleRoute({
    required _i12.Article article,
    _i13.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          ArticleRoute.name,
          args: ArticleRouteArgs(
            article: article,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticleRoute';

  static const _i11.PageInfo<ArticleRouteArgs> page =
      _i11.PageInfo<ArticleRouteArgs>(name);
}

class ArticleRouteArgs {
  const ArticleRouteArgs({
    required this.article,
    this.key,
  });

  final _i12.Article article;

  final _i13.Key? key;

  @override
  String toString() {
    return 'ArticleRouteArgs{article: $article, key: $key}';
  }
}

/// generated route for
/// [_i2.ArticlesPage]
class ArticlesRoute extends _i11.PageRouteInfo<void> {
  const ArticlesRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ArticlesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArticlesRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.GamesPage]
class GamesRoute extends _i11.PageRouteInfo<void> {
  const GamesRoute({List<_i11.PageRouteInfo>? children})
      : super(
          GamesRoute.name,
          initialChildren: children,
        );

  static const String name = 'GamesRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.NonogramPage]
class NonogramRoute extends _i11.PageRouteInfo<void> {
  const NonogramRoute({List<_i11.PageRouteInfo>? children})
      : super(
          NonogramRoute.name,
          initialChildren: children,
        );

  static const String name = 'NonogramRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SavedArticlesPage]
class SavedArticlesRoute extends _i11.PageRouteInfo<void> {
  const SavedArticlesRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SavedArticlesRoute.name,
          initialChildren: children,
        );

  static const String name = 'SavedArticlesRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SettingsPage]
class SettingsRoute extends _i11.PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    _i13.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          SettingsRoute.name,
          args: SettingsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i11.PageInfo<SettingsRouteArgs> page =
      _i11.PageInfo<SettingsRouteArgs>(name);
}

class SettingsRouteArgs {
  const SettingsRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'SettingsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.SlidePuzzlePage]
class SlidePuzzleRoute extends _i11.PageRouteInfo<void> {
  const SlidePuzzleRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SlidePuzzleRoute.name,
          initialChildren: children,
        );

  static const String name = 'SlidePuzzleRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SplashScreen]
class SplashRoute extends _i11.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    _i13.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          SplashRoute.name,
          args: SplashRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i11.PageInfo<SplashRouteArgs> page =
      _i11.PageInfo<SplashRouteArgs>(name);
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.WelcomePage]
class WelcomeRoute extends _i11.PageRouteInfo<void> {
  const WelcomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
