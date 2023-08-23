import 'package:flutter/material.dart';
import 'package:hufs_information/Common_LogoAppBar.dart';
import 'Common_NeumorphicBox.dart';
import 'Common_paddingElement.dart';
import 'Common_CheckBox.dart';
import 'Common_NeumorphicButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

//a, b, c, d, e를 추가하고 b, c를 삭제 후 뒤로가기를 했다가 다시 돌아가면, 삭제했던 b, c가 부활해있다
//귀신이 곡할 노릇이다. 해결 방안은 아직 미지수, 해결 필요

class LikeEmptyRoom extends StatefulWidget {
  final List<String> selectedLectureRooms;

  LikeEmptyRoom({required this.selectedLectureRooms});

  @override
  _LikeEmptyRoomState createState() => _LikeEmptyRoomState();
}

class _LikeEmptyRoomState extends State<LikeEmptyRoom> {
  List<String> selectedToDelete = [];
  List<WidgetWithCheckbox> widgetList = [];

  @override
  void initState() {
    super.initState();

    widgetList = widget.selectedLectureRooms
        .map((room) => WidgetWithCheckbox(text: room))
        .toList();
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('삭제하시겠습니까?'),
          content: Text('선택된 항목들을 삭제하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  widgetList.removeWhere(
                    (widget) => selectedToDelete.contains(widget.text),
                  );
                  selectedToDelete.clear();
                });
                Navigator.pop(context); // 다이얼로그 닫기
              },
              child: Text('확인'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  selectedToDelete.clear();
                });
                Navigator.pop(context); // 다이얼로그 닫기
              },
              child: Text('취소'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widgetList.length,
              itemBuilder: (context, index) {
                return paddingElement(
                  NeumorphicBox(
                    child: Row(
                      children: [
                        Checkbox(
                          key: ValueKey(widgetList[index]
                              .text), //각 요소마다 고유한 Key 부여!! ListView 쓸거만 무조건 요소를 구분해야함
                          value: widgetList[index].isChecked,
                          onChanged: (value) {
                            setState(() {
                              widgetList[index].isChecked = value ?? false;
                              if (value ?? false) {
                                selectedToDelete.add(widgetList[index].text);
                              } else {
                                selectedToDelete.remove(widgetList[index].text);
                              }
                            });
                          },
                        ),
                        Text(widgetList[index].text),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: 150,
            child: NeumorphicButton(
              onPressed: () {
                if (selectedToDelete.isNotEmpty) {
                  _showDeleteConfirmationDialog();
                }
              },
              child: Text('삭제', style: TextStyle(color: Colors.red)),
            ),
          ),
          SizedBox(height: 15)
        ],
      ),
    );
  }
}

class WidgetWithCheckbox {
  final String text;
  bool isChecked;

  WidgetWithCheckbox({required this.text, this.isChecked = false});
}
