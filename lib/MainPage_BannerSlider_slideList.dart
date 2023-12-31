import 'package:flutter/material.dart';
import 'package:hufs_information/Common_Provider.dart';
import 'package:hufs_information/Page_GatherHelp.dart';
import 'package:hufs_information/Page_InfoBus.dart';
import 'Page_InfoLecture.dart';

// ** 설명 **
// 이 파일은 위젯 파일이 아닌 메소드 파일임. 즉, 그냥 그대로 쓰이는 함수
// 중요하진 않은데, 알아서 나쁠 건 없으니깐...

// slideList안에 표시하고 싶은 위젯들 때려박으면 알아서 반영됨.
// 위젯을 그냥 넣어도 되긴 한데, 그러면 보기가 불편하니깐
// 아래에 slide1같이 메소드 따로 만들어서 그 안에 구현하면 더 좋음
// (어려우면 내가 하면 됨. 근데, 짜놓고 vscode에서 버튼 두 번만 눌러도 되긴 함)

//****slide1에 버스 페이지 연결했고, slide2도 빈강의실 페이지로 넘어가도록 수정했음!!****(나영 메모)

List<Widget> slideList(BuildContext context) {
  return [
    slide1(context),
    slide2(context),
    Text(
      '어우 씨 나 그만할래',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  ];
}

GestureDetector slide1(context) {
  return GestureDetector(
    onTap: () async {
      await Navigator.push(
        context,
        // TODO : 넘어가야 할 페이지 다시 정의해야함
        MaterialPageRoute(builder: (context) => InfoBus(context: context)),
      );
    },
    child: Stack(
      // 이미지와 글자 중첩 가능하게 하기 위함
      children: [
        Positioned(
          // 이미지
          bottom: 20,
          right: 10,
          child: Image.asset('assets/images/Main_BusWithBoard.png', width: 170),
        ),
        const Positioned(
          // 텍스트
          left: 10,
          top: 10,
          bottom: 10,
          child: Column(
            // Column을 한 번 더 감싼 이유는, 위 아래 구분지어서 배치할라고 (spaceBetween 쓸라고)
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "다음 버스 출발 시간?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text("알려드릴게요!", style: TextStyle(fontSize: 15)),
                ],
              ),
              Text("더 자세한 정보는 여기를 클릭!",
                  style: TextStyle(
                      fontSize: 10, color: Color.fromRGBO(255, 32, 32, 0.612))),
            ],
          ),
        ),
      ],
    ),
  );
}

//slide1 누르면 넘어가듯이, slide2도 그렇게 수정해두었음!!
//stack이라 글씨 부분만 작동하는 건 고쳐보려다가 포기함
//둘 다 아직 구상되지 않은 페이지라 백지 페이지로 넘어가게 됨. 연결만 시켜놨음!!

GestureDetector slide2(context) {
  return GestureDetector(
    onTap: () async {
      await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => InfoLecture(
                  context: context,
                  selectedLectureProvider: SelectedLectureRoomsProvider(),
                )),
      );
    },

    //수정해야함
    child: Stack(
      children: [
        Positioned(
          bottom: 30,
          right: 10,
          child: Image.asset('assets/images/Main_LectureRoom.png', width: 180),
        ),
        const Positioned(
          left: 10,
          top: 10,
          bottom: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "지금 비어있는 강의실?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text("여긴 어때요?", style: TextStyle(fontSize: 15)),
                ],
              ),
              Text("비어있는 다른 강의실은 여기를 클릭!",
                  style: TextStyle(fontSize: 10, color: Colors.blue)),
            ],
          ),
        ),
      ],
    ),
  );
}
