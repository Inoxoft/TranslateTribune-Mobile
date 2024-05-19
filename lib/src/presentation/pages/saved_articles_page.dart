import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translatetribune/src/configs/configs/get_it.dart';
import 'package:translatetribune/src/configs/router/app_router.dart';
import 'package:translatetribune/src/data/services/saved_articles.dart';
import 'package:translatetribune/src/presentation/shared/saved_article_item.dart';

@RoutePage()
class SavedArticlesPage extends StatelessWidget {
  const SavedArticlesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Favorites',
          style: theme.textTheme.bodyLarge,
        ),
        leading: IconButton(
          onPressed: () {
            HapticFeedback.mediumImpact();
            AppRouter.instance.maybePop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: theme.indicatorColor,
          ),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
      ),
      extendBodyBehindAppBar: false,
      body: StreamBuilder(
        stream: getIt<SavedArticlesService>().watchAllSavedArticles(),
        builder: (context, snapshot) {
          final articles = snapshot.data ?? [];

          if (articles.isNotEmpty) {
            return ListView(
              padding: EdgeInsets.zero,
              children: articles.map((article) {
                return SavedArticleItem(article);
              }).toList(),
            );
          }

          return Center(
            child: Text(
              'No favorites yet!',
              style: theme.textTheme.bodyLarge,
            ),
          );
        },
      ),
    );
  }
}
