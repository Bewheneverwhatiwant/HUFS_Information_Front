import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';
import 'Common_NeumorphicBox.dart';
import 'Common_CheckBox.dart';

class EtcTodayMenu extends StatefulWidget {
  const EtcTodayMenu({required this.context, Key? key});

  final BuildContext context;

  @override
  _EtcTodayMenuState createState() => _EtcTodayMenuState();
}

class _EtcTodayMenuState extends State<EtcTodayMenu> {
  bool isFirstCheckBoxChecked = true; //글로벌캠 체크박스
  bool isSecondCheckBoxChecked = false; //서울캠 체크박스
  bool isMorning = true; //조식 체크박스
  bool isAfternoon = false; //중식 체크박스
  bool isNight = false; //석식 체크박스

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              LogoAppBar(),
              SizedBox(
                height: 10,
              ),
              WhichCampus(), //캠퍼스 선택 체크박스
              SizedBox(
                height: 10,
              ),
              WhichMenu(), //조식, 중식, 석식 중 선택하는 체크박스
              SizedBox(
                height: 10,
              ),
              WhichTimeMenuContainer(), //체크박스에 따라 메뉴 결과를 반환하는 컨테이너!
            ],
          ),
        ],
      ),
    );
  }

//캠퍼스를 선택하는 체크박스 두개가 있는 row
  Row WhichCampus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Checkbox(
              onChanged: (value) {
                setState(() {
                  isFirstCheckBoxChecked =
                      true; //기본적으로 글로벌캠퍼스의 메뉴 목록이 먼저 보이도록 함
                  isSecondCheckBoxChecked = false; //서울캠퍼스 메뉴 목록
                });
              },
              value: isFirstCheckBoxChecked,
            ),
            SizedBox(width: 30),
            Text(
              '글로벌캠퍼스',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            Checkbox(
              onChanged: (value) {
                setState(() {
                  isFirstCheckBoxChecked = false;
                  isSecondCheckBoxChecked = true; //서울캠퍼스가 선택된 상태!!
                });
              },
              value: isSecondCheckBoxChecked,
            ),
            SizedBox(width: 30),
            Text('서울캠퍼스',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

//조식, 중식, 석식 중 하나를 선택하는 체크박스
  Row WhichMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Checkbox(
              onChanged: (value) {
                setState(() {
                  isMorning = true; //기본적으로 조식이 먼저 보이도록 함
                  isAfternoon = false;
                  isNight = false;
                });
              },
              value: isMorning,
            ),
            SizedBox(width: 30),
            Text(
              '조식',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            Checkbox(
              onChanged: (value) {
                setState(() {
                  isMorning = false;
                  isAfternoon = true; //중식이 선택된 상태!!
                  isNight = false;
                });
              },
              value: isAfternoon,
            ),
            SizedBox(width: 30),
            Text('중식',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          children: [
            Checkbox(
              onChanged: (value) {
                setState(() {
                  isMorning = false;
                  isAfternoon = false;
                  isNight = true; //석식이 선탣된 상태!
                });
              },
              value: isNight,
            ),
            SizedBox(width: 30),
            Text('석식',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

//조식, 중식, 석식 중 어떤 체크박스인지 구별 후 메뉴 출력
//각 시간대 별 메뉴 데이터 위젯 만들기!!
  Widget WhichTimeMenuContainer() {
    if (isFirstCheckBoxChecked && isMorning) {
      return global_MorningMenu();
    } else if (isFirstCheckBoxChecked && isAfternoon) {
      return global_AfternoonMenu();
    } else if (isFirstCheckBoxChecked && isNight) {
      return global_NightMenu();
    } else if (isSecondCheckBoxChecked && isMorning) {
      return seoul_MorningMenu();
    } else if (isSecondCheckBoxChecked && isAfternoon) {
      return seoul_AfternoonMenu();
    } else if (isSecondCheckBoxChecked && isNight) {
      return seoul_NightMenu();
    } else {
      return SizedBox.shrink(); // 아무 체크박스도 선택되지 않은 경우 빈 공간을 반환
    }
  }

  Widget global_MorningMenu() {
    return Container(
      child: Column(
        children: [
          MenuContainer(2, '글로벌 조식', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(3, '수육국밥', '쌀밥, 수육국밥, 부추무침, 단무지', '11:00~14:30',
              '후생관 교직원식당', 4900),
          MenuContainer(2, '테스트1', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(4, '테스트2', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트3', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트4', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트5', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트6', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900)
        ],
      ),
    );
  }

  Widget global_AfternoonMenu() {
    return Container(
      child: Column(
        children: [
          MenuContainer(2, '글로벌 중식', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(3, '수육국밥', '쌀밥, 수육국밥, 부추무침, 단무지', '11:00~14:30',
              '후생관 교직원식당', 4900),
          MenuContainer(2, '테스트1', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(4, '테스트2', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트3', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트4', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트5', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트6', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900)
        ],
      ),
    );
  }

  Widget global_NightMenu() {
    return Container(
      child: Column(
        children: [
          MenuContainer(2, '글로벌 석식', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(3, '수육국밥', '쌀밥, 수육국밥, 부추무침, 단무지', '11:00~14:30',
              '후생관 교직원식당', 4900),
          MenuContainer(2, '테스트1', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(4, '테스트2', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트3', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트4', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트5', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트6', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900)
        ],
      ),
    );
  }

  Widget seoul_MorningMenu() {
    return Container(
      child: Column(
        children: [
          MenuContainer(2, '서울 조식', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(3, '수육국밥', '쌀밥, 수육국밥, 부추무침, 단무지', '11:00~14:30',
              '후생관 교직원식당', 4900),
          MenuContainer(2, '테스트1', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(4, '테스트2', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트3', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트4', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트5', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트6', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900)
        ],
      ),
    );
  }

  Widget seoul_AfternoonMenu() {
    return Container(
      child: Column(
        children: [
          MenuContainer(2, '서울 중식', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(3, '수육국밥', '쌀밥, 수육국밥, 부추무침, 단무지', '11:00~14:30',
              '후생관 교직원식당', 4900),
          MenuContainer(2, '테스트1', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(4, '테스트2', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트3', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트4', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트5', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트6', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900)
        ],
      ),
    );
  }

  Widget seoul_NightMenu() {
    return Container(
      child: Column(
        children: [
          MenuContainer(2, '서울 석식', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(3, '수육국밥', '쌀밥, 수육국밥, 부추무침, 단무지', '11:00~14:30',
              '후생관 교직원식당', 4900),
          MenuContainer(2, '테스트1', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(4, '테스트2', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트3', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트4', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트5', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900),
          MenuContainer(2, '테스트6', '쌀밥, 등심돈까스, 치커리무침, 단무지', '11:00~14:30',
              '후생관 학생식당', 4900)
        ],
      ),
    );
  }
}

//식당 건물 타입, 메인 메뉴 또는 식사 주제('기말고사 특식' 등), 모든 메뉴, 검물이름, 식사 가능 시간, 가격
Padding MenuContainer(int type, String MenuTitle, String AllMenu, String place,
    String Time, int Price) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
    child: NeumorphicBox(
      child: Column(
        children: [
          //첫번째 Row는 메인 메뉴
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //숟가락 젓가락 모양의 아이콘 추가하기
              Icon(Icons.food_bank),
              Text(MenuTitle,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          Divider(),
          const SizedBox(height: 16),

          //두번째 Row는 전체 메뉴를 출력
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text(AllMenu)]),

          const SizedBox(height: 16),

          //세번째 Row는 건물, 시간, 가격

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                //지도 현위치 표시 아이콘 추가하기
                Icon(Icons.add_location),
                Text("$place"),
              ]),
              Row(
                children: [
                  //시계 모양 아이콘 추가
                  Icon(Icons.access_alarm),
                  Text("$Time"),
                ],
              ),
              Row(
                children: [
                  Text("$Price"),
                  Text("원"),
                ],
              )
            ],
          ),
        ],
      ),
    ),
  );
}

String getPlace(int type, String place) {
  switch (type) {
    case 1:
      return place;
    case 2:
      return '후생관 학생식당';
    case 3:
      return '후생관 교직원식당';
    case 4:
      return 'HufsDorm 식당';
    default:
      return 'Unknown place: ';
  }
}
