import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:translatetribune/src/configs/router/app_router.dart';
import 'package:translatetribune/src/configs/router/app_router.gr.dart';
import 'package:translatetribune/src/data/models/language_model.dart';
import 'package:translatetribune/src/presentation/shared/settings_item.dart';

@RoutePage()
class MenuPage extends StatelessWidget {
  const MenuPage({
    required this.language,
    super.key,
  });

  final LanguageModel language;

  final String settingsEmoji = '\u{2699}';
  final String heartEmoji = '\u{2764}';
  final String gamesEmoji = '\u{1F3AE}';

  String get now => DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());

  void openSettings() {
    AppRouter.instance.push(SettingsRoute(language: language));
  }

  void openSavedArticles() {
    AppRouter.instance.push(const SavedArticlesRoute());
  }

  void openGames() {
    AppRouter.instance.push(const GamesRoute());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Menu',
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
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24.0),
            SettingsItem(
              '$settingsEmoji Settings',
              onTap: openSettings,
            ),
            const SizedBox(height: 16.0),
            SettingsItem(
              '$heartEmoji Favorite articles',
              onTap: openSavedArticles,
            ),
            const SizedBox(height: 16.0),
            SettingsItem(
              '$gamesEmoji Games',
              onTap: openGames,
            ),
            const Spacer(),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: theme.dividerColor,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: Text(
                  '${language.aiWarning}\n\n$now',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: theme.dividerColor,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
