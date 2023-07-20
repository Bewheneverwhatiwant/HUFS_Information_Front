import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hufs_information/Page_HowToHelpMe.dart';
import 'Common_NeumorphicButton.dart';
import 'Page_AlertMessage.dart';
import 'Page_CreatingChat_Help.dart';
import 'Page_HowToHelpMe.dart';

// type : 버튼 타입을 의미 (1: 택시같이타, 2:배달같이해, 3: 도와줘요)
// place : 장소
// plusInfo : 추가 정보
Padding ChattingRoomList(BuildContext context, int type, String title, String place, String plusInfo,
    int peopleNum, String dueTime, bool isSwitched, bool isIntermediatePage, TextEditingController helpController) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
    child: NeumorphicButton(
       onPressed: () {

          if (isIntermediatePage) {
          // 수정: HowToHelpMe 페이지로 이동하도록 설정
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HowToHelpMe(
                title: title,
                place: place,
                peopleNum: peopleNum,
                plusInfo: plusInfo,
                isSwitched: isSwitched,
                helpText: helpController.text,
                dueTime: dueTime,
                isIntermediatePage: false, // Alert Message를 띄우기 위해 false로 설정
              ),
            ),
          );
        } else {
          showDialog(
            context: context,
            barrierDismissible: false, // 배경을 터치해도 알림창이 닫히지 않도록 설정!(무조건 확인 또는 취소를 눌러야 하니까)
            builder: (BuildContext context) => AlertMessage(
              title: title,
              place: place,
              plusInfo: plusInfo,
              peopleNum: peopleNum,
              dueTime: dueTime,
              isSwitched: isSwitched,
              context: context,
            ),
          );
        }
      },

      child: Column(
        children: [
          //첫번째 Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Row(children: [
                Image.asset('assets/images/Icon-siren.png'),
                const Text("신고하기",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
              ])
            ],
          ),

          const SizedBox(height: 16),

          //두번째 Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(getPlace(type, place)),
                    Text(getplusInfo(type, plusInfo)),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          //세번째 Row

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("현재 $peopleNum명 참가중"),
              //SizedBox(width:28),
              Text("$dueTime까지 모집"),
            ],
          ),
        ],
      ),
    ),
  );
}

String getPlace(int type, String place) {
  switch (type) {
    case 1:
      return place;
    case 2:
      return '수령 장소: $place';
    case 3:
      return '장소: $place';
    default:
      return 'Unknown place: ';
  }
}

String getplusInfo(int type, String plusInfo) {
  switch (type) {
    case 1:
      return plusInfo;
    case 2:
      return '배달비: $plusInfo';
    case 3:
      return '사례: $plusInfo';
    default:
      return 'Unknown place: ';
  }
}
