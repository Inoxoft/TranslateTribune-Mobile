// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i12;
import 'package:translatetribune/src/data/models/article.dart' as _i11;
import 'package:translatetribune/src/data/models/language_model.dart' as _i13;
import 'package:translatetribune/src/presentation/pages/article_page.dart'
    as _i1;
import 'package:translatetribune/src/presentation/pages/articles_page.dart'
    as _i2;
import 'package:translatetribune/src/presentation/pages/games/nanogram/nanogram_page.dart'
    as _i5;
import 'package:translatetribune/src/presentation/pages/games/slide_puzzle/slide_puzzle_page.dart'
    as _i8;
import 'package:translatetribune/src/presentation/pages/games_page.dart' as _i3;
import 'package:translatetribune/src/presentation/pages/menu_page.dart' as _i4;
import 'package:translatetribune/src/presentation/pages/saved_articles_page.dart'
    as _i6;
import 'package:translatetribune/src/presentation/pages/settings_page.dart'
    as _i7;
import 'package:translatetribune/src/presentation/pages/welcome_page.dart'
    as _i9;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    ArticleRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ArticlePage(
          args.article,
          key: args.key,
        ),
      );
    },
    ArticlesRoute.name: (routeData) {
      final args = routeData.argsAs<ArticlesRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ArticlesPage(
          language: args.language,
          key: args.key,
        ),
      );
    },
    GamesRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.GamesPage(),
      );
    },
    MenuRoute.name: (routeData) {
      final args = routeData.argsAs<MenuRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.MenuPage(
          language: args.language,
          key: args.key,
        ),
      );
    },
    NonogramRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.NonogramPage(),
      );
    },
    SavedArticlesRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SavedArticlesPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.SettingsPage(
          language: args.language,
          key: args.key,
        ),
      );
    },
    SlidePuzzleRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.SlidePuzzlePage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.WelcomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ArticlePage]
class ArticleRoute extends _i10.PageRouteInfo<ArticleRouteArgs> {
  ArticleRoute({
    required _i11.Article article,
    _i12.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          ArticleRoute.name,
          args: ArticleRouteArgs(
            article: article,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticleRoute';

  static const _i10.PageInfo<ArticleRouteArgs> page =
      _i10.PageInfo<ArticleRouteArgs>(name);
}

class ArticleRouteArgs {
  const ArticleRouteArgs({
    required this.article,
    this.key,
  });

  final _i11.Article article;

  final _i12.Key? key;

  @override
  String toString() {
    return 'ArticleRouteArgs{article: $article, key: $key}';
  }
}

/// generated route for
/// [_i2.ArticlesPage]
class ArticlesRoute extends _i10.PageRouteInfo<ArticlesRouteArgs> {
  ArticlesRoute({
    required _i13.LanguageModel language,
    _i12.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          ArticlesRoute.name,
          args: ArticlesRouteArgs(
            language: language,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticlesRoute';

  static const _i10.PageInfo<ArticlesRouteArgs> page =
      _i10.PageInfo<ArticlesRouteArgs>(name);
}

class ArticlesRouteArgs {
  const ArticlesRouteArgs({
    required this.language,
    this.key,
  });

  final _i13.LanguageModel language;

  final _i12.Key? key;

  @override
  String toString() {
    return 'ArticlesRouteArgs{language: $language, key: $key}';
  }
}

/// generated route for
/// [_i3.GamesPage]
class GamesRoute extends _i10.PageRouteInfo<void> {
  const GamesRoute({List<_i10.PageRouteInfo>? children})
      : super(
          GamesRoute.name,
          initialChildren: children,
        );

  static const String name = 'GamesRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MenuPage]
class MenuRoute extends _i10.PageRouteInfo<MenuRouteArgs> {
  MenuRoute({
    required _i13.LanguageModel language,
    _i12.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          MenuRoute.name,
          args: MenuRouteArgs(
            language: language,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static const _i10.PageInfo<MenuRouteArgs> page =
      _i10.PageInfo<MenuRouteArgs>(name);
}

class MenuRouteArgs {
  const MenuRouteArgs({
    required this.language,
    this.key,
  });

  final _i13.LanguageModel language;

  final _i12.Key? key;

  @override
  String toString() {
    return 'MenuRouteArgs{language: $language, key: $key}';
  }
}

/// generated route for
/// [_i5.NonogramPage]
class NonogramRoute extends _i10.PageRouteInfo<void> {
  const NonogramRoute({List<_i10.PageRouteInfo>? children})
      : super(
          NonogramRoute.name,
          initialChildren: children,
        );

  static const String name = 'NonogramRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SavedArticlesPage]
class SavedArticlesRoute extends _i10.PageRouteInfo<void> {
  const SavedArticlesRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SavedArticlesRoute.name,
          initialChildren: children,
        );

  static const String name = 'SavedArticlesRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SettingsPage]
class SettingsRoute extends _i10.PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    required _i13.LanguageModel language,
    _i12.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          SettingsRoute.name,
          args: SettingsRouteArgs(
            language: language,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i10.PageInfo<SettingsRouteArgs> page =
      _i10.PageInfo<SettingsRouteArgs>(name);
}

class SettingsRouteArgs {
  const SettingsRouteArgs({
    required this.language,
    this.key,
  });

  final _i13.LanguageModel language;

  final _i12.Key? key;

  @override
  String toString() {
    return 'SettingsRouteArgs{language: $language, key: $key}';
  }
}

/// generated route for
/// [_i8.SlidePuzzlePage]
class SlidePuzzleRoute extends _i10.PageRouteInfo<void> {
  const SlidePuzzleRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SlidePuzzleRoute.name,
          initialChildren: children,
        );

  static const String name = 'SlidePuzzleRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.WelcomePage]
class WelcomeRoute extends _i10.PageRouteInfo<void> {
  const WelcomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
