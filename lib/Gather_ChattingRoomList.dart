import 'package:flutter/material.dart';
import 'Common_NeumorphicButton.dart';

// type : 버튼 타입을 의미 (1: 택시같이타, 2:배달같이해, 3: 도와줘요)
// place : 장소
// plusInfo : 추가 정보
Padding ChattingRoomList(int type, String title, String place, String plusInfo,
    int peopleNum, String dueTime) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
    child: NeumorphicButton(
      onPressed: () => print('채팅 버튼 눌림'),
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
