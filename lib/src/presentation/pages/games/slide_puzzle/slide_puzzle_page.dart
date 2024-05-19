import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:translatetribune/src/configs/router/app_router.dart';
import 'package:translatetribune/src/presentation/pages/games/slide_puzzle/slide_puzzle_game.dart';

@RoutePage()
class SlidePuzzlePage extends StatefulWidget {
  @override
  _SlidePuzzlePageState createState() => _SlidePuzzlePageState();
}

class _SlidePuzzlePageState extends State<SlidePuzzlePage> {
  final SlidePuzzleGame game = SlidePuzzleGame();

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          '15 Puzzle',
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
      body: Builder(
        builder: (context) {
          final completed = game.completed;

          if (completed) {
            HapticFeedback.heavyImpact();
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: completed
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Success!',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: theme.focusColor,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
              const SizedBox(height: 24),
              IgnorePointer(
                ignoring: completed,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    shrinkWrap: true,
                    children: List.generate(
                      game.shuffledGrid.length,
                      (index) {
                        final tile = game.shuffledGrid[index];
                        bool isBlank = tile == 0;
                        return GestureDetector(
                          onTap: () {
                            game.moveTile(tile);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isBlank
                                  ? theme.scaffoldBackgroundColor
                                  : theme.focusColor,
                              border: Border.all(
                                color: theme.focusColor,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: Text(
                                "${isBlank ? ' ' : tile}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                  color: theme.scaffoldBackgroundColor,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Flexible(
                fit: FlexFit.tight,
                child: completed
                    ? Align(
                        alignment: Alignment.topCenter,
                        child: IconButton(
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
                      )
                    : const SizedBox(),
              ),
            ],
          );
        },
      ),
    );
  }
}
