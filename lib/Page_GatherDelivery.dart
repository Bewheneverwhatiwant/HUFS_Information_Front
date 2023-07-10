import 'package:flutter/material.dart';
import 'package:hufs_information/Gather_ChattingRoomList.dart';
import 'package:hufs_information/Gather_CreateChat.dart';
import 'Common_LogoAppBar.dart';
import 'Gather_PointContainer.dart';

//app bar 바로 밑에 point container가 오게하고, +버튼은 위치를 고정시켜야 해서 container랑 안겹치게 children으로 분리되도록 수정함~~

class GatherDelivery extends StatelessWidget {
  const GatherDelivery({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              //여기다가 다른 것(글 띄우는 widget list 등) 추가하면 됨
              LogoAppBar(),
              PointContainer(),
              SizedBox(height: 16),
              ChattingRoomList(
                  2, '엽기떡볶이 드실 분 구합니다', '기숙사 A동', '5000원', 3, '18:25'),
              ChattingRoomList(2, '테스트1', '장소 입력', '가격 입력', 7, '12:34'),
              ChattingRoomList(2, '테스트2', '장소 입력', '가격 입력', 7, '12:34'),
              ChattingRoomList(2, '테스트3', '장소 입력', '가격 입력', 7, '12:34'),
              ChattingRoomList(2, '테스트4', '장소 입력', '가격 입력', 7, '12:34'),
              ChattingRoomList(2, '테스트5', '장소 입력', '가격 입력', 7, '12:34'),
            ],
          ),

          //+버튼 위치 고정
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: CreateChat(
                onPressed: null,
                child: Text('+',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
          ),
        ],
      ),
    );
  }
}
