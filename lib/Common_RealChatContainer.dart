import 'package:flutter/material.dart';
import 'Common_WriteChatText.dart';
import 'package:intl/intl.dart';
import 'Common_NeumorphicButton.dart';
import 'Common_NeumorphicBox.dart';
import 'Page_UserSOS.dart';
import 'Common_paddingElement.dart';
import 'Page_GatherMyPage.dart';

//채팅 말풍선 하나에 채팅을 담는 것

class ChatMessageContainer {
  final String nickName;
  final DateTime sentTime;
  final String displayText;
  bool isMe = false;

  ChatMessageContainer({
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
      Column(
        children: [
          for (var entry in messages)
            if (entry is ChatMessageContainer)
              entry.isMe ? IfIsMe(context, entry) : IfIsNotMe(context, entry),
        ],
      ),
    );
  }

//채팅을 보내는 사람이 본인이 아닐 때, 화면의 왼쪽에 대화목록이 나오게 한다
  Column IfIsNotMe(BuildContext context, ChatMessageContainer entry) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            NeumorphicButton(
              onPressed: () {
                showCustomAlertDialog_user(context);
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
        ),
        SizedBox(height: 5),
      ],
    );
  }

  // ...

  Column IfIsMe(BuildContext context, ChatMessageContainer entry) {
    return Column(
      children: [
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
                        builder: (context) => GatherMyPage(context: context)));
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
            ),
          ],
        ),
      ],
    );
  }
}
