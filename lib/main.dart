import 'package:flutter/material.dart';
import 'Page_MainPage.dart';
import 'test.dart';

void main() {
  int testMode = 0;

  if (testMode == 1)
    runApp(test());

    //[전체메뉴] 탭에서 버튼 클릭 시 해당 항목으로 navigator 연결하기 위해, 메인 페이지를 수정했음. 
    //민감한 부분이니 내가 한 게 맞는지 꼼꼼하게 확인 바람!
  else
    runApp(MaterialApp(
    home: Builder(builder: (BuildContext context) {
      return MainPage(context: context, isButtonEnabled: false,);
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
      home: MainPage(context: context, isButtonEnabled: false,),
    );
  }
}
