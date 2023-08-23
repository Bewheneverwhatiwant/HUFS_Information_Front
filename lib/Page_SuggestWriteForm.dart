import 'package:flutter/material.dart';
import 'package:hufs_information/Common_NeumorphicButton.dart';
import 'Common_LogoAppBar.dart';
import 'Common_SnackBar.dart';
import 'Common_NeumorphicBox.dart';

class SuggestWriteForm extends StatefulWidget {
  final BuildContext context;
  const SuggestWriteForm({required this.context, Key? key});
  @override
  _SuggestWriteFormState createState() => _SuggestWriteFormState();
}

class _SuggestWriteFormState extends State<SuggestWriteForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  bool _isSubmitEnabled = false;

  @override
  void initState() {
    super.initState();
    _messageController.addListener(_checkSubmitButton);
    _titleController.addListener(_checkSubmitButton);
  }

  void _checkSubmitButton() {
    setState(() {
      _isSubmitEnabled = _titleController.text.isNotEmpty &&
          _messageController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NeumorphicBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'HUFS INFOGRAL에 대해 의견을 남겨주셔서 감사합니다.\n더욱 좋은 서비스를 만들기 위해\n꼼꼼히 반영하겠습니다.\n감사드립니다!'),
                  Text('-HUFS INFORGRAL 개발자 올림',
                      style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
            ),
            TextField(
              controller: _titleController,
              decoration:
                  InputDecoration(labelText: '건의사항의 핵심내용을 제목으로 작성해주세요.'),
            ),
            SizedBox(height: 16),
            WriteOpinionHere(), //자세한 요청사항을 작성하는 곳
            Spacer(),
            NeumorphicButton(
              onPressed: _isSubmitEnabled
                  ? () {
                      Navigator.pop(context);
                      showSnackbar(context, '의견이 정상적으로 제출되었습니다!');
                    }
                  : null,
              child: Text('의견 제출하기'),
            ),
          ],
        ),
      ),
    );
  }

  Container WriteOpinionHere() {
    return Container(
      width: 450,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: _messageController, //TextController 추가
        keyboardType:
            TextInputType.multiline, //입력 양이 많으면, 엔터키를 사용하면서 내려갈 수 있는 키보드
        maxLines: null, //글 작성량 제한 x

        decoration: InputDecoration(
          labelText: '여기에 자세한 건의사항을 작성해주세요. 간단할수록 좋아요!',
          border: InputBorder.none, //플러터 기본 파란 input 테두리 숨기기
          contentPadding: EdgeInsets.all(8.0), //TextField 속 내용과 테두리 사이
        ),
      ),
    );
  }
}
