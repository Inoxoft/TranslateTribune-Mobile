import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:translatetribune/src/configs/router/app_router.dart';
import 'package:translatetribune/src/configs/router/app_router.gr.dart';
import 'package:translatetribune/src/data/database/app_database.dart';
import 'package:translatetribune/src/data/models/article.dart';

class SavedArticleItem extends StatefulWidget {
  const SavedArticleItem(
    this.article, {
    super.key,
  });

  final SavedArticle article;

  @override
  State<SavedArticleItem> createState() => _SavedArticleItemState();
}

class _SavedArticleItemState extends State<SavedArticleItem> {
  late final article = widget.article;

  void open() => AppRouter.instance.push(ArticleRoute(
        article: Article.fromSaved(article),
        // saved: true,
      ));

  bool hovered = false;

  void onHover(bool hovered) {
    if (this.hovered != hovered) {
      setState(() {
        this.hovered = hovered;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTapDown: (_) {
        HapticFeedback.mediumImpact();
        onHover(true);
      },
      onTapUp: (_) => onHover(false),
      onTapCancel: () => onHover(false),
      onTap: () {
        HapticFeedback.mediumImpact();
        open();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: theme.indicatorColor,
            ),
          ),
        ),
        margin: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        padding: const EdgeInsets.only(
          top: 24.0,
          bottom: 24.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16,
                  child: Image.asset(article.flagPath),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  article.country.toUpperCase(),
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3,
                  ),
                  textAlign: TextAlign.start,
                ),
                const Spacer(),
                Text(
                  DateFormat('yyyy-MM-dd').format(article.savedAt),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              article.title,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: hovered ? theme.focusColor : null,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              article.content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
