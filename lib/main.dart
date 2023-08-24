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
import 'package:provider/provider.dart';
import 'Common_Provider.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectedLectureRoomsProvider(), // Provider 생성
      child: MaterialApp(
        title: 'HUFS 정보모아',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Pretendard',
        ),
        home: MainPage(
          context: context,
          isButtonEnabled: false,
        ),
      ),
    );
  }
}
