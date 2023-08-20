import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';
import 'dart:async';
import 'Splash2_LogInOrSignUp.dart';

//첫번째 스플래쉬, welcome 화면

class Splash1_Welcome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Splash1_WelcomeState();
}

class Splash1_WelcomeState extends State<Splash1_Welcome> {
  static const splashDuration = 3000; // 3초

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: splashDuration), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Splash2_LogInOrSignUp()));
    });
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      width: double.infinity,
      height: double.infinity,

      //그라데이션 배경 설정
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF29255A), 
            Color(0xFF351553),
          ],
          begin: Alignment.topCenter, //그라데이션 시작(화면 상단 중앙)
          end: Alignment.bottomCenter, // 그라데이션 종료(화면 하단 중앙)
        ),
      ),

      child: Padding(
        padding: EdgeInsets.fromLTRB(25, 143, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 194,
              height: 88,
              child: Image.asset('assets/images/Main_HUFSinfogral.png'),
            ),

            SizedBox(height: 30),

            Container(
              width: 127,
              height: 38,
              child: Text(
                '외대의 모든 정보가\n당신의 손 안에',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}