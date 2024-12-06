import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Day2 {
  const Day2() : super();

  void go() {
    separateData();
  }
}

Future<void> separateData() async {
  final input = await rootBundle.loadString('lib/day2/input');
  final lines = input.split('\n');
  int safeCount = 0;

  for (var line in lines) {
    var parts = line.split(RegExp(r'\s+'))
        .where((part) => RegExp(r'^-?\d+$').hasMatch(part))
        .map(int.parse)
        .toList();
    bool isLineSafe = false;

    for (int i = 0; i < parts.length; i++) {
      var tempParts = List<int>.from(parts)..removeAt(i);
      bool isIncreasing = true;
      bool isDecreasing = true;
      bool isSafe = true;

      for (int j = 0; j < tempParts.length - 1; j++) {
        if (tempParts[j] == tempParts[j + 1] || (tempParts[j + 1] - tempParts[j]).abs() > 3) {
          isSafe = false;
          break;
        }
        if (tempParts[j] < tempParts[j + 1]) {
          isDecreasing = false;
        } else if (tempParts[j] > tempParts[j + 1]) {
          isIncreasing = false;
        }
      }

      if (isSafe && (isIncreasing || isDecreasing)) {
        isLineSafe = true;
        break;
      }
    }

    if (isLineSafe) {
      safeCount++;
    }
  }
  print('Number of safe lines: $safeCount');
}