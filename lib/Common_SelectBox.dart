import 'package:flutter/material.dart';

//삼각형 모양 버튼을 누르면 아래로 선택지가 드롭되는 select input을 구현한 코드임!
//다른 걸로 바꿔도 되는데 drop dowm button이 가장 무난한듯 해서 그거로 함
//넣을 화면에서 각 변수에 대해서 ex) options: List.generate(10, (index) => index + 1) (10까지 드롭다운 만들기) 이런 식으로 조절해주면 됨
//좀 어렵다... 주석 많음

class SelectInput extends StatefulWidget { //무조건 꼭 꼭 stateful로 할 것

  final int itemCount; //0부터 itemCount까지 선택지를 생성
  final int value; //초기값(현재 선택되어있는 값)
  final ValueChanged<int> onChanged; //새로운 값으로 변경하면 호출될 함수

  SelectInput({
    required this.itemCount,
    required this.value,
    required this.onChanged,
  });

  @override
  _SelectInputState createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectInput> {
  int? selectedValue; //nullable로 설정해야 오류안남!!

  @override
  //option list(0~itemCount까지) 생성하는 함수
  void initState() {
    super.initState();
    selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    //드롭다운 버튼 위젯 생성
    return DropdownButton<int>(
      value: selectedValue,
      onChanged: (newValue) {

        //null 처리 무조건 무조건 꼭 할 것
        if (newValue != null) {
          setState(() {
            selectedValue = newValue;
            widget.onChanged(newValue);
          });
        }
      },

      //items로 인해 선택지 항목이 보일 수 있게 됨(항목을 표시하는 역할)
      items: List<DropdownMenuItem<int>>.generate(widget.itemCount + 1, (index) { //이 형식으로 화면에 대입하면 됨!!!
        return DropdownMenuItem<int>(
          value: index,
          child: Text(index.toString()),
        );
      }),
    );
  }
}