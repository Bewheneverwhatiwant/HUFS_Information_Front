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
import 'Page_SOSChattingRoom.dart';

void main() async {
  await dotenv.load();
  PrintBusList();
  //await loadSelectedLectureRooms();
  //loadSelectedLectureRooms();
  runApp(ChangeNotifierProvider(
      create: (context) => ClickCountProvider(),
      child: MaterialApp(
        home: Builder(builder: (BuildContext context) {
          return Splash1_Welcome();
        }),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // 여러 개의 프로바이더 제공
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                SelectedLectureRoomsProvider()), // SelectedLectureRoomsProvider 제공
        ChangeNotifierProvider(
            create: (context) => ClickCountProvider()), // ClickCountProvider 제공
        ChangeNotifierProvider(
            create: (context) =>
                ClickCountProvider_Room()), // ClickCountProvider_Room 제공
      ],
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
