import 'package:flutter/material.dart';
import 'package:hufs_information/Common_LogoAppBar.dart';
import 'Common_NeumorphicBox.dart';
import 'Common_paddingElement.dart';
import 'Common_CheckBox.dart';
import 'Common_NeumorphicButton.dart';
import 'Common_Provider.dart';
import 'Common_Provider.dart';
import 'package:provider/provider.dart';

//이 페이지에서도 InfoLecture 페이지에서 provider로 관리되는 selectedToDelete를 받아와서 띄워야 함. 수정 필요!

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
