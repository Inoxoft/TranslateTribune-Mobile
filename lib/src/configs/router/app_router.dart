import 'package:auto_route/auto_route.dart';
import 'package:translatetribune/src/configs/configs/get_it.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  static AppRouter get instance => getIt<AppRouter>();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: WelcomeRoute.page,
        ),
        AutoRoute(
          path: '/home',
          page: HomeRoute.page,
          children: [
            RedirectRoute(path: '', redirectTo: 'articles'),
            AutoRoute(path: 'articles', page: ArticlesRoute.page),
            AutoRoute(path: 'saved', page: SavedArticlesRoute.page),
            AutoRoute(path: 'games', page: GamesRoute.page),
            AutoRoute(path: 'menu', page: SettingsRoute.page),
            // AutoRoute(path: 'posts', page: PostsRoute.page),
          ],
        ),
        AutoRoute(
          page: ArticleRoute.page,
        ),
        AutoRoute(
          page: NonogramRoute.page,
        ),
        AutoRoute(
          page: SlidePuzzleRoute.page,
        ),
      ];
}
