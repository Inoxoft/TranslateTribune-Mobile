import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:translatetribune/src/configs/router/app_router.dart';

import 'package:translatetribune/src/presentation/pages/games/nanogram/nanogram_game.dart';
import 'package:translatetribune/src/presentation/pages/games/nanogram/widgets/game_view.dart';
import 'package:translatetribune/src/utils/launch.dart';

@RoutePage()
class NonogramPage extends StatefulWidget {
  @override
  _NonogramPageState createState() => _NonogramPageState();
}

class _NonogramPageState extends State<NonogramPage> {
  final NonogramGame game = NonogramGame();

  late final cellSize = MediaQuery.of(context).size.width * 0.8 / game.rows;

  final String howToPlayLink = 'https://translatetribune.com/howto.html';

  @override
  void initState() {
    super.initState();
    game.addListener(listener);
    game.start();
  }

  @override
  void dispose() {
    game.removeListener(listener);
    super.dispose();
  }

  void listener() => setState(() {});

  void openHowToPlay() => Launch.launchURL(howToPlayLink);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Nonograms',
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
        actions: [
          IconButton(
            onPressed: () {
              HapticFeedback.mediumImpact();
              game.start();
            },
            icon: Icon(
              Icons.refresh_rounded,
              color: theme.indicatorColor,
            ),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Builder(
        builder: (context) {
          final completed = game.completed;

          if (completed) {
            HapticFeedback.heavyImpact();
          }

          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        NonogramGameView(
                          game,
                          cellSize: cellSize,
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          height: game.columns * cellSize,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              game.rows,
                              (index) => SizedBox(
                                height: cellSize,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:
                                      game.rowHints[index].asMap().entries.map(
                                    (entry) {
                                      final textColor =
                                          game.checkRowBlocks(index)[entry.key]
                                              ? theme.focusColor
                                              : theme.indicatorColor;
                                      return Text(
                                        '${entry.value} ',
                                        style:
                                            theme.textTheme.bodySmall?.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: textColor,
                                        ),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          game.columns,
                          (index) => SizedBox(
                            width: cellSize,
                            child: Column(
                              children:
                                  game.columnHints[index].asMap().entries.map(
                                (entry) {
                                  final textColor =
                                      game.checkColumnBlocks(index)[entry.key]
                                          ? theme.focusColor
                                          : theme.indicatorColor;
                                  return Text(
                                    '${entry.value} ',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: textColor,
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: openHowToPlay,
                  child: SafeArea(
                    child: Center(
                      child: Text(
                        'How To Play',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (completed)
                Positioned.fill(
                  child: ColoredBox(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Success!',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: theme.focusColor,
                          ),
                        ),
                        const SizedBox(height: 24),
                        IgnorePointer(
                          ignoring: true,
                          child: NonogramGameView(
                            game,
                            cellSize: cellSize,
                          ),
                        ),
                        const SizedBox(height: 24),
                        IconButton(
                          onPressed: () {
                            HapticFeedback.mediumImpact();
                            game.start();
                          },
                          iconSize: 96,
                          icon: Icon(
                            Icons.refresh_rounded,
                            color: theme.focusColor,
                          ),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
