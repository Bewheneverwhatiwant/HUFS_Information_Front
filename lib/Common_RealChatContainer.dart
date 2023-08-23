import 'package:flutter/material.dart';
import 'Common_WriteChatText.dart';
import 'package:intl/intl.dart';
import 'Common_NeumorphicButton.dart';
import 'Common_NeumorphicBox.dart';
import 'Page_UserSOS.dart';
import 'Common_paddingElement.dart';
import 'Page_GatherMyPage.dart';

//채팅 말풍선 하나에 채팅을 담는 것

class ChatMessage {
  final String nickName;
  final DateTime sentTime;
  final String displayText;
  bool isMe = false;

  ChatMessage({
    required this.nickName,
    required this.displayText,
    required this.sentTime,
    required this.isMe,
  });
}

class RealChatContainer extends StatelessWidget {
  final List<dynamic> messages;

  RealChatContainer({required this.messages});

  @override
  Widget build(BuildContext context) {
    return paddingElement(
      messages[0].isMe ? IfIsMe(context) : IfIsNotMe(context),
    );
  }

//채팅을 보내는 사람이 본인이 아닐 때, 화면의 왼쪽에 대화목록이 나오게 한다
  Column IfIsNotMe(BuildContext context) {
    return Column(
      children: [
        for (var entry in messages)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  NeumorphicButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UserSOS(context: context)));
                    },
                    child: Text(entry.nickName),
                  ),
                  SizedBox(width: 5),
                  Container(
                    child: Row(
                      children: [
                        Text(entry.displayText),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                DateFormat('MM월 dd일 HH시 mm분').format(entry.sentTime),
                style: TextStyle(fontSize: 10),
              ), //연도, 월, 일, 시간, 분만 출력하고 싶어서 그렇게 설정함. 수정 가능
            ],
          ),
      ],
    );
  }

//채팅을 보내는 사람이 본인일 때, 채팅이 화면의 오른쪽에 나오게 한다다
  Column IfIsMe(BuildContext context) {
    return Column(
      children: [
        for (var entry in messages)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(entry.displayText),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  NeumorphicButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              GatherMyPage(context: context)));
                    },
                    child: Text(entry.nickName),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                DateFormat('MM월 dd일 HH시 mm분').format(entry.sentTime),
                style: TextStyle(fontSize: 10),
              ), //연도, 월, 일, 시간, 분만 출력하고 싶어서 그렇게 설정함. 수정 가능
            ],
          ),
      ],
    );
  }
}
