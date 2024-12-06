import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Day1 {
  const Day1() : super();

  void printDay() {
    if (kDebugMode) {
      print("Day1");
    }
  }

  void go() {
    separateData();
  }
}

Future<void> separateData() async {
  final input = await rootBundle.loadString('lib/day1/input');
  final lines = input.split('\n');
  List<int> left = [];
  List<int> right = [];

  for (var line in lines) {
    var parts = line.split(RegExp(r'\s+'));
    if (parts.length >1) {
      left.add(int.parse(parts[0]));
      right.add(int.parse(parts[1]));
    }
  }
//PART 1

  left.sort();
  right.sort();
  int totalDifference = 0;
  for(int i = 0; i < left.length; i++) {
    int difference = left[i] - right[i];
    if(difference < 0) {
      difference = right[i] - left[i];
    }
   totalDifference += difference;
  }
  print("Total Difference: $totalDifference");

//PART 2
  int count = 0;
  int similarityScore = 0;
  int totalSimilarity = 0;
  for(int i = 0; i < left.length; i++) {
    List<int> rightList = right;
    count = 0;
    count = right.where((number) => number == left[i]).length;
    similarityScore = count * left[i];
    totalSimilarity += similarityScore;
  }
  print("Similarity Score: $totalSimilarity");
}