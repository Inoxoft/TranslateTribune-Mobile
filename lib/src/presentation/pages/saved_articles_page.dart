import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:translatetribune/src/configs/configs/get_it.dart';
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
