import 'package:auto_route/auto_route.dart';
import 'package:translatetribune/src/configs/configs/get_it.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  static AppRouter get instance => getIt<AppRouter>();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: WelcomeRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: ArticlesRoute.page,
        ),
        AutoRoute(
          page: ArticleRoute.page,
        ),
        AutoRoute(
          page: SavedArticlesRoute.page,
        ),
        AutoRoute(
          page: MenuRoute.page,
        ),
        AutoRoute(
          page: SettingsRoute.page,
        ),
        AutoRoute(
          page: GamesRoute.page,
        ),
        AutoRoute(
          page: NonogramRoute.page,
        ),
        AutoRoute(
          page: SlidePuzzleRoute.page,
        ),
      ];
}
