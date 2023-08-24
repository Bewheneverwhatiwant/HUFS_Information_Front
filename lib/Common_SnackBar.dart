import 'package:flutter/material.dart';

//스낵바를 만드는 위젯. showSnackbar('message')로 사용가능!
//text에 맞게 스낵바의 width가 조정되도록 구현하고 싶었으나, 그렇개 하려면 스낵바를 처음부터 커스텀해야하므로 그 부분까지는 건들지 않았음
//(스낵바를 컨테이너로 감싸고 컨테이너의 width를 조정해도 스낵바의 길이에 변화가 없음. 이유는 플러터에서 snackbar가 scaffold에 의해 고정되기 때문)
// '어? 그럼 toast message를 쓸 수도 있잖아?' -> 그래서 dependency에 fluttertoast도 추가하고 코드도 작성해보았으나, 색상과 위치 등 전혀 디자인이 반영되지 않음
//코드에는 아무런 오류가 없으나 toast message에 디자인이 반영되지 않는 이유는 모르겠음. 시도했던 코드(chatting room list 파일 하단 void fluttertoast 참조)는 남겨둠!

class CustomSnackbar extends StatelessWidget {
  final String message;

  const CustomSnackbar({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Material(
        elevation: 6.0,
        borderRadius: BorderRadius.circular(15.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Text(
              message,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }
}

void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      behavior: SnackBarBehavior.floating,
      content: CustomSnackbar(message: message),
    ),
  );
}
