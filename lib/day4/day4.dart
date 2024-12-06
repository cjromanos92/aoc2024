import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Day4 {
  const Day4() : super();

  void go() {
    readData();
    part2();
  }
}

Future<void> readData() async {
  final input = await rootBundle.loadString('lib/day4/input');
  final lines = input.split('\n');
  final maxLength = lines.map((line) => line.length).reduce((a, b) => a > b ? a : b);
  final grid = lines.map((line) => line.padRight(maxLength, ' ').split('')).toList();
  final rows = grid.length;
  final cols = grid[0].length;
  const target = 'XMAS';
  const targetLength = target.length;
  int count = 0;

  bool isValid(int x, int y) => x >= 0 && y >= 0 && x < rows && y < cols;

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      // Check horizontally (right and left)
      if (j + targetLength <= cols && grid[i].sublist(j, j + targetLength).join() == target) count++;
      if (j - targetLength + 1 >= 0 && grid[i].sublist(j - targetLength + 1, j + 1).reversed.join() == target) count++;

      // Check vertically (down and up)
      if (i + targetLength <= rows && List.generate(targetLength, (k) => isValid(i + k, j) ? grid[i + k][j] : '').join() == target) count++;
      if (i - targetLength + 1 >= 0 && List.generate(targetLength, (k) => isValid(i - k, j) ? grid[i - k][j] : '').join() == target) count++;

      // Check diagonally (down-right and up-left)
      if (i + targetLength <= rows && j + targetLength <= cols && List.generate(targetLength, (k) => isValid(i + k, j + k) ? grid[i + k][j + k] : '').join() == target) count++;
      if (i - targetLength + 1 >= 0 && j - targetLength + 1 >= 0 && List.generate(targetLength, (k) => isValid(i - k, j - k) ? grid[i - k][j - k] : '').join() == target) count++;

      // Check diagonally (down-left and up-right)
      if (i + targetLength <= rows && j - targetLength + 1 >= 0 && List.generate(targetLength, (k) => isValid(i + k, j - k) ? grid[i + k][j - k] : '').join() == target) count++;
      if (i - targetLength + 1 >= 0 && j + targetLength <= cols && List.generate(targetLength, (k) => isValid(i - k, j + k) ? grid[i - k][j + k] : '').join() == target) count++;
    }
  }
  print('Total occurrences of "XMAS": $count');
}

Future<void> part2() async {
  final input = await rootBundle.loadString('lib/day4/input');
  final lines = input.split('\n');
  final maxLength = lines.map((line) => line.length).reduce((a, b) => a > b ? a : b);
  final grid = lines.map((line) => line.padRight(maxLength, ' ').split('')).toList();
  final rows = grid.length;
  final cols = grid[0].length;
  int countXMASX = 0;

  bool isValid(int x, int y) => x >= 0 && y >= 0 && x < rows && y < cols;

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (isValid(i, j) && grid[i][j] == 'A') {
        bool checkDiagonal(int dx1, int dy1, int dx2, int dy2) {
          return (isValid(i + dx1, j + dy1) && isValid(i + dx2, j + dy2) &&
              ((grid[i + dx1][j + dy1] == 'M' && grid[i + dx2][j + dy2] == 'S') ||
                  (grid[i + dx1][j + dy1] == 'S' && grid[i + dx2][j + dy2] == 'M')));
        }

        bool checkCrossingDiagonal() {
          return (checkDiagonal(-1, -1, 1, 1)) &&
              (checkDiagonal(-1, 1, 1, -1) );
        }

        if (checkCrossingDiagonal()) {
          countXMASX++;
        }
      }
    }
  }
  print('Total occurrences of X-"MAS": $countXMASX');
}