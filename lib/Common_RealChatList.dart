import 'package:flutter/material.dart';
import 'Common_RealChatContainer.dart';
import 'Common_WriteChatText.dart';

//채팅 말풍선 하나하나를 컨테이너에 담아, 채팅 리스트를 반환하는 것

class ChatMessage {
  final String nickName;
  final DateTime sentTime;
  final String displayText;

  ChatMessage({required this.nickName, required this.displayText, required this.sentTime});
}


class RealChatList extends StatelessWidget {
  final List<ChatMessage> chatMessages;

  RealChatList({required this.chatMessages});

  @override
  Widget build(BuildContext context) {
    // 시간 순서로 정렬
    chatMessages.sort((a, b) => a.sentTime.compareTo(b.sentTime));

    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: chatMessages.length,
                itemBuilder: (_, index) {
                  // RealChatContainer에 전달할 messages 리스트와 displayText를 변경
                  List<ChatMessage> messages = chatMessages.where((message) {
                    return message.nickName == chatMessages[index].nickName;
                  }).toList();
                  String displayText = chatMessages[index].displayText;

                  return RealChatContainer(messages: messages.cast<dynamic>(), displayText: displayText); // .cast<dynamic>() 추가
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
