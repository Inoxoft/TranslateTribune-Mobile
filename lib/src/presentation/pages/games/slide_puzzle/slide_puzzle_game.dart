import 'dart:math';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class SlidePuzzleGame extends ChangeNotifier {
  List<int> shuffledGrid = [];
  List<int> rightGrid = [];

  final int cells = 16;
  final Random random = Random();

  int moves = 0;

  bool get completed {
    Function eq = const ListEquality().equals;

    final s = List.from(shuffledGrid)..remove(0);
    final r = List.from(rightGrid)..remove(0);

    return eq(s, r);
  }

  void start() {
    moves = 0;
    generateGrid();
    notifyListeners();
  }

  void generateGrid() {
    rightGrid = List.generate(cells, (index) => index);
    shuffledGrid = List.from(rightGrid);
    shuffledGrid.shuffle(random);
    notifyListeners();
  }

  void moveTile(index) {
    if (index == 0) {
      return;
    }

    int blankTile = shuffledGrid.indexOf(0);
    int selectedTile = shuffledGrid.indexOf(index);

    if (canMove(selectedTile, blankTile)) {
      shuffledGrid[selectedTile] = 0;
      shuffledGrid[blankTile] = index;

      moves++;

      notifyListeners();
    }
  }

  bool canMove(int selectedTile, int blankTile) {
    // Determine the grid size per row or column (assuming a square grid)
    int gridSize = sqrt(cells).toInt();

    // Calculate row and column for the blank and selected tiles
    int blankRow = blankTile ~/ gridSize;
    int blankCol = blankTile % gridSize;
    int selectedRow = selectedTile ~/ gridSize;
    int selectedCol = selectedTile % gridSize;

    // Check if the selected tile is adjacent to the blank tile
    return (blankRow == selectedRow &&
            (blankCol == selectedCol + 1 || blankCol == selectedCol - 1)) ||
        (blankCol == selectedCol &&
            (blankRow == selectedRow + 1 || blankRow == selectedRow - 1));
  }
}
