import 'package:flutter/material.dart';
import 'package:hufs_information/Common_NeumorphicButton.dart';
import 'Common_LogoAppBar.dart';
import 'MainPage_GatherGroup.dart';
import 'MainPage_SmallButton.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: LogoAppBar(),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: <Widget>[
                GatherGroup(), // 모집 영역
                Padding(
                  // 서브메뉴 영역
                  padding: EdgeInsets.only(top: 20),
                  child: SubMenu(), // 너무 길어서 하단에 위젯 따로 분리했음!
                ),
              ],
            )));
  }
}

class SubMenu extends StatelessWidget {
  const SubMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SmallButton(
              onPressed: () {
                print('오늘 메뉴 클릭됨');
              },
              title: '오늘메뉴는?',
              imageName: 'images/Main_TodayMenu.png'),
        ),
        SizedBox(width: 40),
        Expanded(
          child: SmallButton(
              onPressed: () {
                print('건의사항 클릭됨');
              },
              title: '건의할게요!',
              imageName: 'images/Main_Suggestion.png'),
        )
      ],
    );
  }
}
