import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';

//ChattingRoomList에서 채팅방을 신고하는 페이지(유저 신고 및 차단 아님!)

class SOSChattingRoom extends StatelessWidget {
  final BuildContext context;
  const SOSChattingRoom({required this.context, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
    );
  }
}