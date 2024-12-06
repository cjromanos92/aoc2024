import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Day3 {
  const Day3() : super();

  void go() {
    separateData();
  }
}

Future<void> separateData() async {
  final input = await rootBundle.loadString('lib/day3/input');
  final perform = <String>[];
  final parts = input.split(RegExp(r'do\(\)'));

  for (var part in parts) {
    final dontIndex = part.indexOf("don't()");
    if (dontIndex != -1) {
      part = part.substring(0, dontIndex);
    }
    if (part.isNotEmpty) {
      perform.add(part.trim());
    }

    int sumOfNewMults = 0;
    final regex = RegExp(r'mul\((\d{1,3}),(\d{1,3})\)');
    for (var item in perform) {
      final matches = regex.allMatches(item);
      for (final match in matches) {
        final x = int.parse(match.group(1)!);
        final y = int.parse(match.group(2)!);
        sumOfNewMults += x * y;
      }
    }
    // print('Sum of mults: $sumOfNewMults');
  }
}
