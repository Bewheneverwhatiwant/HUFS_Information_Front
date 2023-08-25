import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';

//전역적인 상태 관리를 위한 provider 만들기. 어렵군...

class SelectedLectureRoomsProvider extends ChangeNotifier {
  List<String> selectedLectureRooms = [];
//빈강의실 추가
  void addSelectedLectureRoom(String room) {
    selectedLectureRooms.add(room);
    notifyListeners();
  }

//빈강의실 삭제
  void removeSelectedLectureRoom(String room) {
    selectedLectureRooms.remove(room);
    notifyListeners();
  }

//빈강의실 추가, 삭제 등 상태관리를 위한 provider 만들기
  void updateSelectedRooms({
    required String RoomNumber,
    required String whichDay,
    required String AllTime,
  }) {
    selectedLectureRooms.add('$RoomNumber, $whichDay, $AllTime');
    notifyListeners();
  }
}

//유저 신고 clickCount 관리를 위한 provider
class ClickCountProvider extends ChangeNotifier {
  int _clickCount = 0;

  int get clickCount => _clickCount;

  void incrementClickCount() {
    _clickCount++;
    notifyListeners();
  }
}

class ClickCountProvider_Room extends ChangeNotifier {
  int _clickCount = 0;

  int get clickCount => _clickCount;

  void incrementClickCount() {
    _clickCount++;
    notifyListeners();
  }
}
