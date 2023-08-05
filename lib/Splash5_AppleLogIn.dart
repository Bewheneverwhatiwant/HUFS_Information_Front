import 'package:flutter/material.dart';
import 'package:hufs_information/Common_SnackBar.dart';
import 'Page_MainPage.dart';

class Splash5_AppleLogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
      children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        //그라데이션 배경 만들기

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF29255A),
              Color(0xFF351553), 
            ],
            begin: Alignment.topCenter, //그라데이션 시작(화면 상단 중앙)
            end: Alignment.bottomCenter, //그라데이션 종료(화면 하단 중앙)
          ),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              SizedBox(height: 20),
              Text(
                '어떻게 저떻게 애플 로그인 짠!',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  //회원가입 완료 버튼을 누르면 홈화면으로 이동
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage(context: context, isButtonEnabled: false,)));
                 showSnackbar(context, '애플 로그인에 성공하였습니다!');
                },
                child: Text('애플 자동 로그인 완료!'),
              ),
            ],
          ),
        ),
      ),
      Positioned(
            top: 20,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
      ],
      ),
    );
  }
}
