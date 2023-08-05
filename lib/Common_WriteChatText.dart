import 'package:flutter/material.dart';


//채팅을 입력하는 부분
class WriteChatText extends StatefulWidget {
  final String displayText;
  final ValueChanged<String> onTextSubmitted; //전송여부

  WriteChatText({required this.displayText, required this.onTextSubmitted});

  @override
  WriteChatTextState createState() => WriteChatTextState();
}

class WriteChatTextState extends State<WriteChatText> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textEditingController,
                  onChanged: (value) {
                    setState(() {
                      widget.onTextSubmitted(value); //사용자 입력이 변경될 때마다 호출
                    });
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.onTextSubmitted(_textEditingController.text); //전송 버튼 누를 때 호출
                  _textEditingController.clear();
                },
                child: Text('전송'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
