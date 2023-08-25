import 'package:flutter/material.dart';
import 'Common_WriteChatText.dart';
import 'package:intl/intl.dart';
import 'Common_NeumorphicButton.dart';
import 'Common_NeumorphicBox.dart';
import 'Page_UserSOS.dart';
import 'Common_paddingElement.dart';
import 'Page_GatherMyPage.dart';

class ChatMessageContainer {
  final String nickName;
  final DateTime sentTime;
  String displayText; //final 제거(메시지 블라인드를 위해)
  bool isMe = false;
  bool isHost = false;

  ChatMessageContainer({
    required this.nickName,
    required this.displayText,
    required this.sentTime,
    required this.isMe,
    required this.isHost,
  });
}

class RealChatContainer extends StatefulWidget {
  final List<dynamic> messages;

  RealChatContainer({required this.messages});

  @override
  _RealChatContainerState createState() => _RealChatContainerState();
}

class _RealChatContainerState extends State<RealChatContainer> {
  String targetNickName = "";
  int clickCount = 0;

  void incrementClickCount() {
    setState(() {
      clickCount++; // 클릭 횟수 증가
    });
  }

  @override
  Widget build(BuildContext context) {
    return paddingElement(
      Column(
        children: [
          for (var entry in widget.messages)
            if (entry is ChatMessageContainer)
              entry.isMe ? IfIsMe(context, entry) : IfIsNotMe(context, entry),
        ],
      ),
    );
  }

  Column IfIsNotMe(BuildContext context, ChatMessageContainer entry) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            NeumorphicButton(
              onPressed: () {
                setState(() {
                  targetNickName =
                      entry.nickName; //버튼을 클릭하면, 버튼에 있는 닉네임이 타겟닉네임에 담김
                });
                showCustomAlertDialog_user(
                    context,
                    entry.isHost,
                    entry.nickName,
                    widget.messages,
                    clickCount,
                    incrementClickCount); //방장인지 아닌지 유무를 전달해준다!
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
                    setState(() {
                      targetNickName = entry.nickName;
                    });
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
