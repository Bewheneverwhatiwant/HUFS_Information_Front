import 'package:flutter/material.dart';
import 'Page_MainPage.dart';

void main() {
  runApp(MaterialApp(
    home: Builder(builder: (BuildContext context) {
      return MainPage(
        context: context,
        isButtonEnabled: false,
      );
    }),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HUFS 정보모아',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Pretendard',
      ),
      home: MainPage(
        context: context,
        isButtonEnabled: false,
      ),
    );
  }
}
