import 'package:flutter/material.dart';
import 'package:hufs_information/Common_paddingElement.dart';
import 'package:hufs_information/Page_EtcSuggestion.dart';
import 'package:hufs_information/Page_EtcTodayMenu.dart';
import 'package:hufs_information/Page_GatherDelivery.dart';
import 'package:hufs_information/Page_GatherHelp.dart';
import 'package:hufs_information/Page_GatherTaxi.dart';
import 'package:hufs_information/Page_InfoBus.dart';
import 'package:hufs_information/Page_InfoLecture.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'Common_LogoAppBar_NoBack.dart';
import 'MainPage_GatherGroup.dart';
import 'MainPage_SmallButton.dart';
import 'MainPage_BannerSlider.dart';
import 'MainPage_MenuList.dart';
import 'Page_GatherMyPage.dart';
import 'Common_NeumorphicBox.dart';
import 'Page_InfoLecture.dart';
import 'Common_Provider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  final BuildContext
      context; // context 매개변수 추가(슬라이드 바의 버튼을 눌러서 해당 항목으로 이동할 수 있도록 기능을 넣으려면 반드시 추가해야 했음)
  final bool isButtonEnabled; // 버튼 활성화 여부 추가함!!!
  const MainPage(
      {required this.context, required this.isButtonEnabled, Key? key});

//계층구조 확인 결과, InfoLecture 위젯이 MainPage와 같은 레벨이라서, MainPage에서 InfoLecture로 전환될 때 provider를 넘겨줘야만 InfoLecture에서 provider 사용가능
  void _navigateToInfoLecture(BuildContext context) {
    final selectedLectureProvider =
        Provider.of<SelectedLectureRoomsProvider>(context, listen: false);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => InfoLecture(
          context: context, selectedLectureProvider: selectedLectureProvider),
    ));
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = const BorderRadius.only(
      // 둥근모서리 속성 미리 정의
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    return Scaffold(
      appBar: LogoAppBar_NoBack(),
      body: Builder(builder: (BuildContext context) {
        return SlidingUpPanel(
          panel: panelInside(),
          collapsed: panelOutside(radius),
          body: mainBody(),
          borderRadius: radius,
          backdropEnabled: true,
          minHeight: 70.0,
          maxHeight: 600.0,
        );
      }),
    );
  }

  Padding mainBody() {
    //내부에 쓰인 marginElement 메소드는 하단에 분리되어있으며, margin을 주는 요소임
    return Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            GatherGroup(), // [파일 분리] 모집 영역
            paddingTop(BannerSlider()), //[파일 분리] 배너 슬라이더
            paddingTop(subMenu()), // [분리] 서브 메뉴 (오늘메뉴, 건의사항)
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EtcTodayMenu(context: context)));
              },
              title: '오늘메뉴는?',
              imageName: 'assets/images/Main_TodayMenu.png'),
        ),
        SizedBox(width: 40),
        Expanded(
          child: SmallButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EtcSuggestion(context: context)));
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
            slideBar(),
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
      physics: const ClampingScrollPhysics(),
      children: <Widget>[
        const SizedBox(height: 8.0),
        slideBar(),
        const SizedBox(height: 30),
        // [파일분리] MenuList(text:내용, isTitle:제목인가?, onPressed:누르면 할 거)

        //navigator를 적용하기 위해 대폭 수정한 부분. !!꼼꼼한 확인 바람!!
        //navigator를 사용하기 위해 of 메소드를 썼고, context 변수를 추가한 게 주된 변경사항임!
        //이로써, 슬라이드를 올리면 나오는 전체메뉴 탭에서 페이지로 바로 이동이 가능해짐.
        MenuList(
          text: '알뜰모집',
          isTitle: true,
        ),
        MenuList(
          text: '택시 같이타!',
          onPressed: isButtonEnabled
              ? () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GatherTaxi(context: context)));
                }
              : null,
          lockAvailable: !isButtonEnabled,
        ),
        MenuList(
          text: '배달 같이 해!',
          onPressed: isButtonEnabled
              ? () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GatherDelivery(context: context)));
                }
              : null,
          lockAvailable: !isButtonEnabled,
        ),
        //택시랑 배달만 lock available을 걸어서 17:00~00:00가 아니라면 회색 자물쇠 아이콘이 옆에 생성되게
        MenuList(
          text: '도와줘요!',
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => GatherHelp(context: context)));
          },
        ),
        MenuList(
          text: '마이포인트 (포인트 적립, 사용)',
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => GatherMyPage(context: context)));
          },
        ),
        MenuList(text: '실시간 정보', isTitle: true),
        MenuList(
          text: '버스 위치 정보',
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => InfoBus(context: context)));
          },
        ),
        MenuList(
          text: '빈 강의실 찾기',
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => InfoLecture(
                      context: context,
                      selectedLectureProvider: SelectedLectureRoomsProvider(),
                    )));
          },
        ),
        MenuList(text: '기타 메뉴', isTitle: true),
        MenuList(
          text: '오늘의 메뉴는?',
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EtcTodayMenu(context: context)));
          },
        ),
        MenuList(
          text: '건의할게요!',
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EtcSuggestion(context: context)));
          },
        ),
      ],
    );
  }

  Align slideBar() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        // 긴 회색 막대 바(슬라이드 가능 암시)
        width: 100,
        height: 5,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
      ),
    );
  }
}
