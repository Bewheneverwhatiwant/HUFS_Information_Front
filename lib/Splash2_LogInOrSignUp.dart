import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';
import 'Splash3_SignUp.dart';
import 'Splash4_GoogleLogIn.dart';
import 'Splash5_AppleLogIn.dart';
import 'Common_paddingElement.dart';
import 'Splash1_Welcome.dart';
import 'Page_MainPage.dart';

//두번째 스플래쉬, 로그인 또는 회원가입 화면
class Splash2_LogInOrSignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Splash2_LogInOrSignUpState();
}

class Splash2_LogInOrSignUpState extends State<Splash2_LogInOrSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        //그라데이션 배경 만들기

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF29255A),
              Color(0xFF351553),
            ],
            begin: Alignment.topCenter, // 그라데이션 시작(화면 상단 중앙)
            end: Alignment.bottomCenter, // 그라데이션 종료(화면 하단 중앙)
          ),
        ),

        child: Center(
          child: paddingElement(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Image.asset('assets/images/Main_LogIn.png'),
                SizedBox(height: 30),
                Container(
                    child: Text('원하는 플랫폼을 이용하여\n로그인을 진행해주세요',
                        style: TextStyle(color: Colors.white))),
                Spacer(),
                Container(
                  child: Column(
                    children: [
                      //이미지, 텍스트, 다음페이지 받아서 버튼 반환하는 메소드를 밑에 만들어둠!

                      createButtonWithImageAndTextAndNavigation(
                          'assets/images/Icon-AppBar.png', 'SIGN UP', () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Splash3_SignUp()));
                      }),
                      SizedBox(height: 15),
                      createButtonWithImageAndTextAndNavigation(
                          'assets/images/Icon_GoogleLogIn.png',
                          'SIGN IN BY GOOGLE', () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Splash4_GoogleLogIn()));
                      }),
                      SizedBox(height: 15),
                      createButtonWithImageAndTextAndNavigation(
                          'assets/images/Icon_AppleLogIn.png',
                          'SIGN IN BY APPLE', () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Splash5_AppleLogIn()));
                      }),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//버튼 함수
Widget createButtonWithImageAndTextAndNavigation(
  String imagePath,
  String buttonText,
  VoidCallback onPressed,
) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Container(
      width: 300,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Image.asset(imagePath),
            SizedBox(width: 30),
            Text(
              buttonText,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    ),
  );
}
