import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:translatetribune/src/data/models/article.dart';
import 'package:translatetribune/src/data/models/language_model.dart';
import 'package:translatetribune/src/presentation/shared/article_item.dart';

class NewsBuilder extends StatelessWidget {
  const NewsBuilder({
    required this.future,
    required this.language,
    this.filter,
    super.key,
  });

  final Future<List<Article>>? future;
  final LanguageModel language;
  final String? filter;

  bool matchFilter(Article article) {
    if (filter == null || filter!.isEmpty) {
      return true;
    }

    return article.title.toLowerCase().contains(filter!.toLowerCase()) ||
        article.content.toLowerCase().contains(filter!.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapsot) {
        if (snapsot.hasData) {
          final articles = snapsot.data!;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: articles.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final article = articles[index];
              if (matchFilter(article)) {
                return ArticleItem(article);
              }

              return const SizedBox();
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
