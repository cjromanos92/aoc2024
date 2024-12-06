import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

import 'day1/day1.dart';
import 'day2/day2.dart';
import 'day3/day3.dart';
import 'day4/day4.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final days = [
    const Day1(),
    const Day2(),
    const Day3(),
    const Day4(),
    // const Day5(),
    // const Day6(),
    // const Day7(),
    // const Day8(),
    // const Day9(),
    // const Day10(),
    // const Day11(),
    // const Day12(),
    // const Day13(),
    // const Day14(),
    // const Day15(),
    // const Day16(),
    // const Day17(),
    // const Day18(),
    // const Day19(),
    // const Day20(),
    // const Day21(),
    // const Day22(),
    // const Day23(),
    // const Day24(),
    // const Day25(),
  ];

  Day1 day1 = const Day1();
  Day2 day2 = const Day2();
  Day3 day3 = const Day3();
  Day4 day4 = const Day4();
  day1.go();
  day2.go();
  day3.go();
  day4.go();

}









class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.red,child: Center()),
    );
  }
}
