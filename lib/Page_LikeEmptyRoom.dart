import 'package:flutter/material.dart';
import 'package:hufs_information/Common_LogoAppBar.dart';

class LikeEmptyRoom extends StatefulWidget {
  final List<String> selectedLectureRooms;

  LikeEmptyRoom({required this.selectedLectureRooms});

  @override
  _LikeEmptyRoomState createState() => _LikeEmptyRoomState();
}

class _LikeEmptyRoomState extends State<LikeEmptyRoom> {
  @override
  Widget build(BuildContext context) {
    print(
        'Number of selected lecture rooms: ${widget.selectedLectureRooms.length}');
    return Scaffold(
      appBar: LogoAppBar(),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            '즐겨찾기 목록:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.selectedLectureRooms.length,
              itemBuilder: (context, index) {
                print(
                    'Selected lecture room at index $index: ${widget.selectedLectureRooms[index]}');
                return ListTile(
                  title: Text(widget.selectedLectureRooms[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
