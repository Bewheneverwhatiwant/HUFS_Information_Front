import 'package:flutter/material.dart';
import 'API_BusList.dart';
import 'Page_MainPage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'Splash1_Welcome.dart';
import 'Splash2_LogInOrSignUp.dart';
import 'Page_InfoLecture.dart';
import 'Page_LikeEmptyRoom.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await dotenv.load();
  PrintBusList();
  //await loadSelectedLectureRooms();
  //loadSelectedLectureRooms();
  runApp(MaterialApp(
    home: Builder(builder: (BuildContext context) {
      return Splash1_Welcome();
    }),
  ));
}

/*
void loadSelectedLectureRooms() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Load selectedLectureRooms from SharedPreferences
  List<String>? savedLectureRooms =
      prefs.getStringList('selected_lecture_rooms');

  // 만약 저장된 정보가 있다면 selectedLectureRooms에 할당
  if (savedLectureRooms != null) {
    InfoLecture.selectedLectureRooms = savedLectureRooms;
  }
}
*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HUFS 정보모아',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Pretendard',
      ),
      home: MainPage(
        context: context,
        isButtonEnabled: false,
      ),
    );
  }
}
