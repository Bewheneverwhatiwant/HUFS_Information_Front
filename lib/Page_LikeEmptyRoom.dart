import 'package:flutter/material.dart';
import 'package:hufs_information/Common_LogoAppBar.dart';
import 'Common_NeumorphicBox.dart';
import 'Common_paddingElement.dart';
import 'Common_CheckBox.dart';
import 'Common_NeumorphicButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

//오늘의 교훈: 가려운 곳을 정확히 찾아서 긁도록 하자. 쓸데없는 리스트를 늘어놓지 말자.
//페이지 전환 시 즐겨찾기 삭제 반영되도록 수정, 그러나 main page로 갔다가 다시 들어가면 즐겨찾기 내역이 사라짐(정보 저장 안됨)
//shared preferences 적용 시도 중

class LikeEmptyRoom extends StatefulWidget {
  final List<String> selectedLectureRooms;

  LikeEmptyRoom({required this.selectedLectureRooms});

  @override
  _LikeEmptyRoomState createState() => _LikeEmptyRoomState();
}

class _LikeEmptyRoomState extends State<LikeEmptyRoom> {
  List<String> selectedToDelete = [];

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
                  widget.selectedLectureRooms.removeWhere(
                    (room) => selectedToDelete.contains(room),
                  );
                  selectedToDelete.clear();
                });
                Navigator.pop(context);
              },
              child: Text('확인'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  selectedToDelete.clear();
                });
                Navigator.pop(context);
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
              itemCount: widget.selectedLectureRooms.length,
              itemBuilder: (context, index) {
                return paddingElement(
                  NeumorphicBox(
                    child: Row(
                      children: [
                        Checkbox(
                          key: ValueKey(widget.selectedLectureRooms[index]),
                          value: selectedToDelete
                              .contains(widget.selectedLectureRooms[index]),
                          onChanged: (value) {
                            setState(() {
                              if (value ?? false) {
                                selectedToDelete
                                    .add(widget.selectedLectureRooms[index]);
                              } else {
                                selectedToDelete
                                    .remove(widget.selectedLectureRooms[index]);
                              }
                            });
                          },
                        ),
                        Text(widget.selectedLectureRooms[index]),
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
