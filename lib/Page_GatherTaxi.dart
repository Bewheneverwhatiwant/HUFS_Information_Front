import 'package:flutter/material.dart';
import 'package:hufs_information/Gather_ChattingRoomList.dart';
import 'package:hufs_information/Gather_CreateChat.dart';
import 'package:hufs_information/Page_CreatingChat_Help.dart';
import 'Common_LogoAppBar.dart';
import 'Gather_PointContainer.dart';
import 'Page_CreatingChat_Delivery.dart';

//point container 하단에 check box 두개를 추가하고, 체크박스에 따라 global campus와 seoul campus를 달리 볼 수 있도록 설정함!
class GatherTaxi extends StatefulWidget {
  const GatherTaxi({required this.context, Key? key});

  final BuildContext context;

  @override
  _GatherTaxiState createState() => _GatherTaxiState();
}

class _GatherTaxiState extends State<GatherTaxi> {
  bool isFirstCheckBoxChecked = true;
  bool isSecondCheckBoxChecked = false;
  int clickCount = 0;

  void incrementClickCount() {
    setState(() {
      clickCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              LogoAppBar(),
              PointContainer(),
              SizedBox(
                height: 20,
              ),
              WhichCampus(), //체크박스 2개가 Row로 배치
              SizedBox(height: 16),
              _getSelectedCampusContainer(), //어떤 체크박스를 선택하느냐에 따라 캠퍼스가 달라짐
            ],
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: CreateChat(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatingChat_Help()),
                );
              },
              child: Text('+',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Row WhichCampus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Checkbox(
              onChanged: (value) {
                setState(() {
                  isFirstCheckBoxChecked =
                      true; //기본적으로 글로벌캠퍼스의 채팅방 목록이 먼저 보이도록 함
                  isSecondCheckBoxChecked = false; //서울캠퍼스 채팅방 목록
                });
              },
              value: isFirstCheckBoxChecked,
            ),
            SizedBox(width: 30),
            Text(
              '글로벌캠퍼스',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            Checkbox(
              onChanged: (value) {
                setState(() {
                  isFirstCheckBoxChecked = false;
                  isSecondCheckBoxChecked = true; //서울캠퍼스가 선택된 상태!!
                });
              },
              value: isSecondCheckBoxChecked,
            ),
            SizedBox(width: 30),
            Text('서울캠퍼스',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _getSelectedCampusContainer() {
    if (isFirstCheckBoxChecked) {
      return GlobalCampus(
        incrementClickCount: incrementClickCount,
        clickCount: clickCount,
      );
    } else if (isSecondCheckBoxChecked) {
      return SeoulCampus(
        incrementClickCount: incrementClickCount,
        clickCount: clickCount,
      );
    } else {
      return SizedBox.shrink(); // 아무 체크박스도 선택되지 않은 경우 빈 공간을 반환
    }
  }

  Widget GlobalCampus({
    required VoidCallback incrementClickCount,
    required int clickCount,
  }) {
    return Container(
      child: Column(
        children: [
          ChattingRoomList(
              context,
              incrementClickCount,
              clickCount,
              1,
              '서현가실 분',
              '외대 -> 서현',
              '',
              3,
              '18:25',
              true,
              false,
              TextEditingController()),
          ChattingRoomList(context, incrementClickCount, clickCount, 1, '테스트1',
              '장소 입력', '', 7, '12:34', true, false, TextEditingController()),
          ChattingRoomList(context, incrementClickCount, clickCount, 1, '테스트2',
              '장소 입력', '', 7, '12:34', true, false, TextEditingController()),
          ChattingRoomList(context, incrementClickCount, clickCount, 1, '테스트3',
              '장소 입력', '', 7, '12:34', true, false, TextEditingController()),
          ChattingRoomList(context, incrementClickCount, clickCount, 1, '테스트4',
              '장소 입력', '', 7, '12:34', true, false, TextEditingController()),
          ChattingRoomList(context, incrementClickCount, clickCount, 1, '테스트5',
              '장소 입력', '', 7, '12:34', true, false, TextEditingController()),
        ],
      ),
    );
  }

  Widget SeoulCampus({
    required VoidCallback incrementClickCount,
    required int clickCount,
  }) {
    return Container(
      child: Column(
        children: [
          ChattingRoomList(
              context,
              incrementClickCount,
              clickCount,
              1,
              '서울에서 대전 있나요??',
              '강남역 11번 출구 -> 대전역',
              '',
              3,
              '12:10',
              true,
              false,
              TextEditingController()),
          ChattingRoomList(context, incrementClickCount, clickCount, 1, '테스트1',
              '장소 입력', '', 7, '12:34', true, false, TextEditingController()),
          ChattingRoomList(context, incrementClickCount, clickCount, 1, '테스트2',
              '장소 입력', '', 7, '12:34', true, false, TextEditingController()),
          ChattingRoomList(context, incrementClickCount, clickCount, 1, '테스트3',
              '장소 입력', '', 7, '12:34', true, false, TextEditingController()),
          ChattingRoomList(context, incrementClickCount, clickCount, 1, '테스트4',
              '장소 입력', '', 7, '12:34', true, false, TextEditingController()),
          ChattingRoomList(context, incrementClickCount, clickCount, 1, '테스트5',
              '장소 입력', '', 7, '12:34', true, false, TextEditingController())
        ],
      ),
    );
  }
}
