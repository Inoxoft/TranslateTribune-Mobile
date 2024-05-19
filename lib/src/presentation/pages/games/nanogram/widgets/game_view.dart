import 'package:flutter/material.dart';
import 'package:translatetribune/src/presentation/pages/games/nanogram/nanogram_game.dart';

class NonogramGameView extends StatelessWidget {
  const NonogramGameView(
    this.game, {
    required this.cellSize,
    super.key,
  });

  final NonogramGame game;
  final double cellSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: game.rows * cellSize,
      height: game.columns * cellSize,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: game.columns,
        ),
        itemCount: game.rows * game.columns,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          int row = index ~/ game.columns;
          int col = index % game.columns;
          return GestureDetector(
            onTap: () => game.selectCell(row, col),
            child: Container(
              decoration: BoxDecoration(
                color: game.selectedMatrix[row][col]
                    ? theme.hoverColor
                    : Colors.transparent,
                border: Border.all(
                  width: 0.5,
                  color: theme.dividerColor,
                ),
              ),
              width: cellSize,
              height: cellSize,
            ),
          );
        },
      ),
    );
  }
}
