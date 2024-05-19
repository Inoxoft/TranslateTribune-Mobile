import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:translatetribune/src/configs/configs/get_it.dart';
import 'package:translatetribune/src/configs/router/app_router.dart';
import 'package:translatetribune/src/configs/router/app_router.gr.dart';
import 'package:translatetribune/src/data/models/article.dart';
import 'package:translatetribune/src/data/services/saved_articles.dart';
import 'package:translatetribune/src/utils/launch.dart';

@RoutePage()
class ArticlePage extends StatelessWidget {
  const ArticlePage(
    this.article, {
    // required this.language,
    super.key,
  });

  final Article article;
  // final LanguageModel language;
  void openSource() => Launch.launchURL(article.link!);

  void share() async {
    final textToShare =
        '${article.title}\n\n${article.content}\n\n${article.link}';

    await Share.share(textToShare);
  }

  Future save() async {
    await getIt<SavedArticlesService>().saveArticle(article);
  }

  Future removeFromSaved() async {
    await getIt<SavedArticlesService>().removeFromSavedArticle(article);
  }

  void showSuccessSnackbar(BuildContext context, bool saved) {
    final snackBar = SnackBar(
      content: Text(
        saved
            ? 'Removed from saved articles!'
            : 'Article saved! You can find it in the menu.',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontSize: 16,
            ),
      ),
      backgroundColor: const Color(0xFF141414),
      action: SnackBarAction(
        label: 'Open',
        textColor: Colors.black,
        backgroundColor: Theme.of(context).hoverColor,
        onPressed: () => AppRouter.instance.push(const SavedArticlesRoute()),
      ),
    );

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        actions: [
          StreamBuilder(
            stream: getIt<SavedArticlesService>().watchSavedArticleById(
              article.id,
            ),
            builder: (context, snapshot) {
              final bool saved = snapshot.data != null;
              return IconButton(
                onPressed: () async {
                  HapticFeedback.mediumImpact();
                  saved ? await removeFromSaved() : await save();

                  showSuccessSnackbar(context, saved);
                },
                icon: Icon(
                  saved ? Icons.favorite : Icons.favorite_outline,
                  color: theme.indicatorColor,
                ),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
              );
            },
          ),
          IconButton(
            onPressed: () {
              HapticFeedback.mediumImpact();
              share();
            },
            icon: Icon(
              Icons.ios_share,
              color: theme.indicatorColor,
            ),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
        ],
      ),
      extendBodyBehindAppBar: false,
      body: SafeArea(
        top: false,
        left: true,
        right: true,
        bottom: false,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
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
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              article.title,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              article.content,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16.0),
            if (article.hasSource)
              GestureDetector(
                onTap: () {
                  HapticFeedback.mediumImpact();
                  openSource();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      article.linkName!.toUpperCase(),
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    SizedBox(
                      height: 32,
                      child: Image.asset('assets/go_to.png'),
                    ),
                  ],
                ),
              ),
            const SafeArea(
              top: false,
              left: false,
              right: false,
              bottom: true,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
