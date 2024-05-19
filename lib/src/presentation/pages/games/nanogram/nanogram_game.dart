import 'dart:math';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class NonogramGame extends ChangeNotifier {
  List<List<bool>> matrix = [];
  List<List<int>> rowHints = [];
  List<List<int>> columnHints = [];

  List<List<bool>> selectedMatrix = [];
  List<List<int>> selectedRowHints = [];
  List<List<int>> selectedColumnHints = [];

  final int rows = 8;
  final int columns = 8;
  final Random random = Random();

  bool get completed {
    Function deepEq = const DeepCollectionEquality().equals;

    return deepEq(matrix, selectedMatrix);
  }

  void start() {
    generateMatrixes();
    generateHints();
    generateSelectedHints();
  }

  void generateMatrixes() {
    matrix = randomMatrix;

    matrix.forEach((element) {
      print(element);
    });

    selectedMatrix = List.generate(
      rows,
      (_) => List.generate(
        columns,
        (_) => false,
      ),
    );
  }

  List<List<bool>> get randomMatrix {
    List<List<bool>> m = [];
    do {
      m = List.generate(
        rows,
        (_) => List.generate(
          columns,
          (_) => random.nextBool(),
        ),
      );
    } while (!checkMatrix(m));

    return m;
  }

  bool checkMatrix(List<List<bool>> matrix) {
    // Check each row
    bool allRowsValid = matrix.every((row) => row.contains(true));

    // Check each column
    int numColumns = matrix[0].length;
    bool allColumnsValid = true;

    for (int i = 0; i < numColumns; i++) {
      bool columnContainsOne = false;
      for (int j = 0; j < matrix.length; j++) {
        if (matrix[j][i]) {
          columnContainsOne = true;
          break;
        }
      }
      if (!columnContainsOne) {
        allColumnsValid = false;
        break;
      }
    }

    return allRowsValid && allColumnsValid;
  }

  void generateHints() {
    rowHints = generateRowHints(matrix);
    columnHints = generateColumnHints(matrix);
    notifyListeners();
  }

  void generateSelectedHints() {
    selectedRowHints = generateRowHints(selectedMatrix);
    selectedColumnHints = generateColumnHints(selectedMatrix);
    notifyListeners();
  }

  void selectCell(int row, int col) {
    selectedMatrix[row][col] = !selectedMatrix[row][col];
    notifyListeners();

    generateSelectedHints();
  }

  List<List<int>> generateRowHints(List<List<bool>> matrix) {
    return matrix.map((row) {
      List<int> hint = [];
      int count = 0;
      for (var cell in row) {
        if (cell) {
          count++;
        } else if (count > 0) {
          hint.add(count);
          count = 0;
        }
      }
      if (count > 0) hint.add(count);
      return hint;
    }).toList();
  }

  List<List<int>> generateColumnHints(List<List<bool>> matrix) {
    List<List<int>> columnHints = List.generate(columns, (_) => []);
    for (int i = 0; i < columns; i++) {
      int count = 0;
      for (int j = 0; j < rows; j++) {
        if (matrix[j][i]) {
          count++;
        } else if (count > 0) {
          columnHints[i].add(count);
          count = 0;
        }
      }
      if (count > 0) columnHints[i].add(count);
    }
    return columnHints;
  }

  List<bool> checkRowBlocks(int rowIndex) {
    List<int> userRowPattern = [];
    int count = 0;

    // Extract the user pattern from the selectedMatrix
    for (bool value in selectedMatrix[rowIndex]) {
      if (value) {
        count++;
      } else if (count > 0) {
        userRowPattern.add(count);
        count = 0;
      }
    }
    if (count > 0) userRowPattern.add(count);

    // Compare user pattern with the hints
    List<bool> correctness = List<bool>.filled(
      rowHints[rowIndex].length,
      false,
    );

    for (int i = 0;
        i < rowHints[rowIndex].length && i < userRowPattern.length;
        i++) {
      correctness[i] = (rowHints[rowIndex][i] == userRowPattern[i]);
    }

    return correctness;
  }

  List<bool> checkColumnBlocks(int columnIndex) {
    List<int> userColumnPattern = [];
    int count = 0;

    // Extract the user pattern from the selectedMatrix
    for (List<bool> row in selectedMatrix) {
      if (row[columnIndex]) {
        count++;
      } else if (count > 0) {
        userColumnPattern.add(count);
        count = 0;
      }
    }
    if (count > 0) userColumnPattern.add(count);

    // Compare user pattern with the hints
    List<bool> correctness = List<bool>.filled(
      columnHints[columnIndex].length,
      false,
    );

    for (int i = 0;
        i < columnHints[columnIndex].length && i < userColumnPattern.length;
        i++) {
      correctness[i] = (columnHints[columnIndex][i] == userColumnPattern[i]);
    }

    return correctness;
  }
}
