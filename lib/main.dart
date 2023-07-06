import 'package:flutter/material.dart';
import 'Page_Main.dart';
import 'test.dart';

void main() {
  int testMode = 0;

  if (testMode == 1)
    runApp(test());
  else
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HUFS 정보모아',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
