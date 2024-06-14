import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:translatetribune/src/configs/router/app_router.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        const ArticlesRoute(),
        const SavedArticlesRoute(),
        const GamesRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Articles',
              icon: Icon(
                Icons.library_books,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Favorites',
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: 'Games',
              icon: Icon(Icons.auto_awesome_mosaic),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.menu),
            ),
          ],
        );
      },
    );
  }
}
