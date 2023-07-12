import 'package:flutter/material.dart';

/* 

모든 InputText가 채워지고 checkBox가 체크되면 버튼이 활성화되는 코드를 작성하려 했으나 실패...^^!
일간은 그냥 파란 버튼 뜨게 해놓을게... 나중에 원인 알것같으면 같이 고치자
난 진짜 도저히 에러 해결 못하겠어 ㅠㅠㅠㅠㅠㅠㅠㅠ
밑에 코드 참고하면서 에러 원인 찾아보라고 남겨둠...

class FormButton extends StatefulWidget {
  final String value1;
  final int value2;
  final String value3;
  final bool isChecked;

  FormButton({
    required this.value1,
    required this.value2,
    required this.value3,
    required this.isChecked,
  });

  @override
  _FormButtonState createState() => _FormButtonState();
}

class _FormButtonState extends State<FormButton> {
  bool isFormValid() {
    // 모든 TextField가 채워졌는지 확인
    final value1 = widget.value1;
    final value2 = widget.value2;
    final value3 = widget.value3;

    if (value1.isEmpty || value2.toString().isEmpty || value3.isEmpty) {
      return false;
    }

    // 체크박스가 체크되었는지 확인
    return widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isFormValid()
          ? () {
              // 버튼이 클릭되었을 때 수행할 동작(채팅방 형성 및 토스트 메시지) 나중에 제작해야됨
            }
          : null,
      child: Text(
        '모임 생성',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 4),
        // primary에 줄이 그어진 상태: 현재 버튼 비활성화 상태라는 뜻!
        primary: isFormValid() ? Colors.blue : Colors.grey,
      ),
    );
  }
}
*/

class FormButton extends StatelessWidget {

  @override
  Widget build (BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text('모임 생성', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 4),
        backgroundColor: Colors.blue,
        )
      );
  }
}