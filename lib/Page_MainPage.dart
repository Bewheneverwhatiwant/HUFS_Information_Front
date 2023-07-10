import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'Common_LogoAppBar.dart';
import 'MainPage_GatherGroup.dart';
import 'MainPage_SmallButton.dart';
import 'MainPage_BannerSlider.dart';
import 'MainPage_MenuList.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = const BorderRadius.only(
      // 둥근모서리 속성 미리 정의
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    return Scaffold(
        appBar: LogoAppBar(), // [파일 분리] 상단의 앱 바 (AppBar)
        body: SlidingUpPanel(
          // 들어올릴 때 나타나는 패널
          panel: panelInside(), // [분리] 위젯 들어올릴 때 나타날 내용
          collapsed: panelOutside(radius), // [분리] 축소 시 나타날 내용
          body: mainBody(), // [분리] 기본 레이아웃(먼저 눈에 보이는 body)
          borderRadius: radius, // 둥근 모서리
          backdropEnabled: true,
          minHeight: 70.0,
          maxHeight: 600.0,
        ));
  }

  Padding mainBody() {
    //내부에 쓰인 marginElement 메소드는 하단에 분리되어있으며, margin을 주는 요소임
    return Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            GatherGroup(), // [파일 분리] 모집 영역
            marginElement(BannerSlider()), //[파일 분리] 배너 슬라이더
            marginElement(subMenu()), // [분리] 서브 메뉴 (오늘메뉴, 건의사항)
            SizedBox(height: 150)
          ],
        ));
  }

  Row subMenu() {
    return Row(
      children: [
        Expanded(
          child: SmallButton(
              onPressed: () {
                print('오늘 메뉴 클릭됨');
              },
              title: '오늘메뉴는?',
              imageName: 'assets/images/Main_TodayMenu.png'),
        ),
        SizedBox(width: 40),
        Expanded(
          child: SmallButton(
              onPressed: () {
                print('건의사항 클릭됨');
              },
              title: '건의할게요!',
              imageName: 'assets/images/Main_Suggestion.png'),
        )
      ],
    );
  }

  Container panelOutside(radius) {
    // 슬라이드 위젯이 축소됐을 때 나타날 내용
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: radius,
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 8.0),
            Container(
              // 긴 회색 막대 바(슬라이드 가능 암시)
              width: 100,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
            ),
            SizedBox(height: 20.0),
            Text("메뉴 전체보기",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  ListView panelInside() {
    // 슬라이드 위젯이 올라갔을 때 나타날 내용
    return ListView(
      children: <Widget>[
        const SizedBox(height: 30),
        // [파일분리] MenuList(text:내용, isTitle:제목인가?, onPressed:누르면 할 거)
        MenuList(text: '알뜰모집', isTitle: true),
        MenuList(text: '택시 같이타!', onPressed: () => print('[전체]택시 같이타')),
        MenuList(text: '버스 같이타!', onPressed: () => print('[전체]버스 같이타')),
        MenuList(text: '도와줘요!', onPressed: () => print('[전체]도와줘요')),
        MenuList(
            text: '마이포인트 (포인트 적립, 사용)', onPressed: () => print('[전체]마이포인트')),
        MenuList(text: '실시간 정보', isTitle: true),
        MenuList(text: '버스 위치 정보', onPressed: () => print('[전체]버스 위치 정보')),
        MenuList(text: '빈 강의실 찾기', onPressed: () => print('[전체]빈 강의실 찾기')),
        MenuList(text: '기타 메뉴', isTitle: true),
        MenuList(text: '오늘의 메뉴는?', onPressed: () => print('[전체]오늘의 메뉴')),
        MenuList(text: '건의할게요!', onPressed: () => print('[전체]건의 사항')),
      ],
    );
  }

  Padding marginElement(child) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: child,
    );
  }
}
