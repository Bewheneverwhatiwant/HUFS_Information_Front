import 'package:flutter/material.dart';
import 'Common_WriteChatText.dart';

//채팅 말풍선 하나에 채팅을 담는 것

class ChatMessage {
  final String nickName;
  final DateTime sentTime;
  final String displayText;

  ChatMessage(
      {required this.nickName,
      required this.displayText,
      required this.sentTime});
}

class RealChatContainer extends StatelessWidget {
  final List<dynamic> messages; // List<dynamic>로 변경

  RealChatContainer({required this.messages, required String displayText});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var entry in messages)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(entry.nickName),
                Text(entry.displayText),
              ],
            ),
        ],
      ),
    );
  }
}
