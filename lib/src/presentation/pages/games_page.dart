import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translatetribune/src/configs/router/app_router.dart';
import 'package:translatetribune/src/configs/router/app_router.gr.dart';
import 'package:translatetribune/src/presentation/shared/settings_item.dart';

@RoutePage()
class GamesPage extends StatelessWidget {
  const GamesPage({
    super.key,
  });

  final String nonogramEmoji = '\u{1F9E9}';
  final String snakeEmoji = '\u{1F40D}';
  final String fifteenPuzzleNumberEmoji = '\u{1F522}';

  void openNonogram() {
    AppRouter.instance.push(const NonogramRoute());
  }

  void openSlidePuzzle() {
    AppRouter.instance.push(const SlidePuzzleRoute());
  }

  void openSnake() {
    // AppRouter.instance.push(const SnakeRoute());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Games',
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
              '$nonogramEmoji Nonograms game',
              onTap: openNonogram,
            ),
            const SizedBox(height: 24.0),
            SettingsItem(
              '$fifteenPuzzleNumberEmoji 15 Puzzle game',
              onTap: openSlidePuzzle,
            ),
            // const SizedBox(height: 16.0),
            // SettingsItem(
            //   '$snakeEmoji Snake game',
            //   onTap: openSnake,
            // ),
          ],
        ),
      ),
    );
  }
}
