import 'package:flutter/material.dart';
import 'Common_RealChatContainer.dart';
import 'Common_WriteChatText.dart';

//채팅 말풍선 하나하나를 컨테이너에 담아, 채팅 리스트를 반환하는 것
//임시 데이터가 저장된 곳

class ChatMessage {
  final String nickName;
  final DateTime sentTime;
  final String displayText;
  final bool isMe;

  ChatMessage({
    required this.nickName,
    required this.displayText,
    required this.sentTime,
    required this.isMe,
  });
}

class RealChatList extends StatelessWidget {
  final List<ChatMessage> chatMessages; //채팅을 리스트로 저장
  final int type; // ChattingRoomList의 type 값

  RealChatList({
    required this.chatMessages,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    List<ChatMessage> filteredMessages;

    if (type == 2) {
      filteredMessages = [
        ChatMessage(
          isMe: false,
          nickName: '꼬마개발자',
          displayText: '안녕하세요',
          sentTime: DateTime.now(),
        ),
        ChatMessage(
          isMe: false,
          nickName: '거부기',
          displayText: '혹시 언제 주문하실건가요?',
          sentTime: DateTime.now().add(Duration(minutes: 5)),
        ),
        ChatMessage(
          isMe: true,
          nickName: '기니피그',
          displayText: '나는 언제나 배고프다',
          sentTime: DateTime.now().add(Duration(minutes: 5)),
        ),
        ChatMessage(
          isMe: false,
          nickName: '거부기',
          displayText: '많이 배고프신가보네요...',
          sentTime: DateTime.now().add(Duration(minutes: 5)),
        ),
        ChatMessage(
          isMe: true,
          nickName: '기니피그',
          displayText: '얼른 주문하자.',
          sentTime: DateTime.now().add(Duration(minutes: 5)),
        ),
      ];
    } else if (type == 1) {
      filteredMessages = [
        ChatMessage(
          isMe: false,
          nickName: '꼬마개발자',
          displayText: '어디까지 가시나요?',
          sentTime: DateTime.now(),
        ),
        ChatMessage(
          isMe: false,
          nickName: '거부기',
          displayText: '저희 사당까지 갑니다!!',
          sentTime: DateTime.now().add(Duration(minutes: 5)),
        ),
        ChatMessage(
          isMe: true,
          nickName: '기니피그',
          displayText: '어디서 내릴 예정이신가요?',
          sentTime: DateTime.now().add(Duration(minutes: 5)),
        ),
        ChatMessage(
          isMe: false,
          nickName: '꼬마개발자',
          displayText: '저희 아마 서울역?',
          sentTime: DateTime.now(),
        ),
        ChatMessage(
          isMe: true,
          nickName: '기니피그',
          displayText: '거긴 사당이 아니잖아요..',
          sentTime: DateTime.now().add(Duration(minutes: 5)),
        ),
      ];
    } else if (type == 3) {
      filteredMessages = [
        ChatMessage(
          isMe: false,
          nickName: '꼬마개발자',
          displayText: '저 바퀴벌레 잘 잡습니다',
          sentTime: DateTime.now(),
        ),
        ChatMessage(
          isMe: false,
          nickName: '거부기',
          displayText: '저는 곱등이 잘 잡습니다',
          sentTime: DateTime.now().add(Duration(minutes: 5)),
        ),
        ChatMessage(
          isMe: true,
          nickName: '기니피그',
          displayText: '두분 다 이든하우스로 와주세요',
          sentTime: DateTime.now().add(Duration(minutes: 5)),
        ),
        ChatMessage(
          isMe: false,
          nickName: '거부기',
          displayText: '죄송합니다 제가 바퀴벌레를 무서워해서요',
          sentTime: DateTime.now().add(Duration(minutes: 5)),
        ),
        ChatMessage(
          isMe: false,
          nickName: '꼬마개발자',
          displayText: '아 저는 곱등이를 무서워해서요 죄송해요',
          sentTime: DateTime.now(),
        ),
        ChatMessage(
          isMe: true,
          nickName: '기니피그',
          displayText: '?',
          sentTime: DateTime.now().add(Duration(minutes: 5)),
        ),
        ChatMessage(
          isMe: true,
          nickName: '기니피그',
          displayText: '??',
          sentTime: DateTime.now().add(Duration(minutes: 5)),
        ),
        ChatMessage(
          isMe: false,
          nickName: '꼬마개발자',
          displayText: 'bb',
          sentTime: DateTime.now(),
        ),
      ];
    } else {
      // 만약 type이 1, 2, 3이 아닌 다른 경우에는 원래의 chatMessages 사용
      filteredMessages = chatMessages;
    }

    filteredMessages.sort((a, b) => a.sentTime.compareTo(b.sentTime));

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: filteredMessages.length,
            itemBuilder: (_, index) {
              String currentNickName = filteredMessages[index].nickName;
              List<ChatMessage> messages = filteredMessages.where((message) {
                return message.nickName == currentNickName;
              }).toList();

              return RealChatContainer(
                messages: messages.cast<dynamic>(),
              );
            },
          ),
        ],
      ),
    );
  }
}
