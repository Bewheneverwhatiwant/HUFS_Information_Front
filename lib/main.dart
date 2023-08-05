import 'package:flutter/material.dart';
import 'Page_MainPage.dart';
import 'Splash1_Welcome.dart';
import 'Splash2_LogInOrSignUp.dart';

void main() {
  runApp(MaterialApp(
    home: Builder(builder: (BuildContext context) {
      return Splash1_Welcome();
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
