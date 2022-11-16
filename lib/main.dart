import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'game.dart';

double tileSize = 16;
void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Game RE2D',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Game(),
    );
  }
}
