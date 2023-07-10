import 'package:flutter/material.dart';
import 'package:hufs_information/Common_ChattingRoomList.dart';
import 'package:hufs_information/Common_EnterChatRoomButton.dart';
import 'Common_LogoAppBar.dart';
import 'Common_PointContainer.dart';

//app bar 바로 밑에 point container가 오게하고, +버튼은 위치를 고정시켜야 해서 container랑 안겹치게 children으로 분리되도록 수정함~~

class GatherHelp extends StatelessWidget {
  const GatherHelp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        
        children: [
          Column(
            children: [

              //여기다가 다른 것(글 띄우는 widget list 등) 추가하면 됨
              LogoAppBar(),
              PointContainer(),
              SizedBox(height:16),
              ChattingRoomList(),
            ],
          ),

          //+버튼 위치 고정
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: EnterChatRoom(onPressed: null, child: Text('+', style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
          ),
        ],
      ),
    );
  }
}

