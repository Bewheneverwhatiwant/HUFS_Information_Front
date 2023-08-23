import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';
import 'Common_NeumorphicButton.dart';
import 'Common_NeumorphicBox.dart';
import 'Common_CheckBox.dart';
import 'Page_LikeEmptyRoom.dart';
import 'Common_Snackbar.dart';
import 'dart:io'; //즐겨찾기 페이지에 정보를 넘겨주기 위해, txt를 거쳐야 하므로, txt 파일 생성을 위해 import
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

//빈강의실을 찾아주는 페이지. 'HUFS 빈강의실 찾기' 기존 어플의 절차를 참고하여 만들었음!
//서울 또는 글로벌 -> 건물 또는 시간 -> 건물이면 6개 중 택1 / 시간이면 9개 중 1개 이상 선택(모두 보기 또는 1개 이상 만족하는 결과 보기)

class InfoLecture extends StatefulWidget {
  const InfoLecture({required this.context, Key? key});
  static List<String> selectedLectureRooms = []; // Public and static
  final BuildContext context;

//이 페이지의 정보를 즐겨찾기 페이지로 넘겨주는 함수
  void navigateToLikeEmptyRoom(List<String> selectedLectureRooms) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LikeEmptyRoom(
        selectedLectureRooms: selectedLectureRooms,
        //context: context,
      ),
    ));
  }

  @override
  _InfoLectureState createState() => _InfoLectureState();
}

class _InfoLectureState extends State<InfoLecture> {
  String selectedOption = ''; //글로벌캠퍼스 0r 서울캠퍼스인지 선택. 아래 코드에서 a, b로 표현
  String selectedSubOption = ''; //건물별로 볼지, 시간별로 볼지 선택. 아래 코드에서 c, d로 표현
  int selectedGlobalBuilding = -1; //글로벌캠퍼스 건물별 선택 정보를 int로 저장하기 위한 변수
  int selectedSeoulBuilding = -1; //서울캠퍼스 건물별 선택 정보를 int로 저장하기 위한 변수
  int selectedGlobalTime = -1; //글로벌캠퍼스 시간별 선택 정보를 int로 저장하기 위한 변수
  int selectedSeoulTime = -1; //서울캠퍼스 시간별 선택 정보를 int로 저장하기 위한 변수
  int myBuilding = -1;
  String bottomText = "";
  bool _isChecked = false;
  bool isFinded = false; //빈강의실 목록이 처음에 안보이게 하기 위한 변수
  List<String> selectedLectureRooms = []; //체크된 강의실을 저장하는 리스트
  List<bool> lectureRoomCheckStates = List.generate(20,
      (index) => false); //대충  길이 8로 초기화. 마찬가지로 체크된 항목들을 저장하는 리스트(rue, false)
  //나중에 즐겨찾기에서 띄우기 위해, 체크된 항목들의 RoomNumber, whichDay, AllTime을 따로 리스트에 담기 위해 만듦.
  //즉 즐겨찾기에서, RoomNumber[i], whichDay[i], AllTime[i] 하고 i<=lectureRoomCheckStates.length 하려고.
  List<String> RoomNumbers = [];
  List<String> whichDays = [];
  List<String> AllTimes = [];

/*
//비동기 함수에서 UI blocking이 일어나는 것 같아서(체크 시 화면 멈춤 현상), 개선하고자 새로 만들어본 함수
  Future<void> updateSelectedLectureRooms() async {
    List<String> updatedLectureRooms = [];

    for (int i = 0; i < lectureRoomCheckStates.length; i++) {
      if (lectureRoomCheckStates[i]) {
        String roomInfo = '${RoomNumbers[i]}, ${whichDays[i]}, ${AllTimes[i]}';
        updatedLectureRooms.add(roomInfo);
      }
    }

    setState(() {
      selectedLectureRooms = updatedLectureRooms;
    });

    print('저장된 즐겨찾기: $selectedLectureRooms');
  }
  */

//실제 빈강의실 정보를 하나하나 담은 컨테이너인데, checkbox가 있어서 stateful class 안에 선언했음
  Widget LectureRoomContainer(
      int index, String RoomNumber, String whichDay, String AllTime) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: NeumorphicBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              onChanged: (value) async {
                setState(() {
                  lectureRoomCheckStates[index] = value ?? false;
                });

                if (value == true) {
                  RoomNumbers.add(RoomNumber);
                  whichDays.add(whichDay);
                  AllTimes.add(AllTime);

                  //await updateSelectedLectureRooms(); //비동기 함수 호출 ->이렇게 했는데도 UI blocking 발생 중
                  saveSelectedLectureRooms();
                }
              },
              value: lectureRoomCheckStates[index],
            ),
            SizedBox(width: 50),
            Container(width: 80, child: Text(RoomNumber)),
            Container(width: 80, child: Text(whichDay)),
            Container(width: 80, child: Text(AllTime)),
          ],
        ),
      ),
    );
  }

//UI 블로킹을 개선하지 않았지만, 즐겨찾기 페이지에 출력되는 것을 확인하기 위해 남겨둔 함수
  void saveSelectedLectureRooms() async {
    selectedLectureRooms.clear(); //이거 추가 꼭 해야함
    // SharedPreferences prefs =
    //await SharedPreferences.getInstance(); //sharedPreferences를 사용해보자~! -> 나중에 알아보도록 하자~! 오류 폭탄~(화면 로딩 멈춤(?))

    for (int i = 0; i < lectureRoomCheckStates.length; i++) {
      if (lectureRoomCheckStates[i]) {
        String roomInfo =
            '강의실번호,요일,시간, $i'; //만약 체크됐다면(value==true), roomInfo에 담음
        //String roomInfo = '${RoomNumbers[i]}, ${whichDays[i]}, ${AllTimes[i]}';

        selectedLectureRooms.add(roomInfo); //리스트에 체크된 항목들을 String으로 담음
      }
    }

    //await prefs.setStringList(
    //'selected_lecture_rooms', selectedLectureRooms); //즐겨찾기를 저장
    print('저장된 즐겨찾기: $selectedLectureRooms');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            LikeRoomButton(),
            SizedBox(height: 10),
            Text(
              '1. 어떤 캠퍼스의 빈 강의실을 조회하시겠어요?',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedOption = 'a';
                        selectedSubOption = '';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary:
                          selectedOption == 'a' ? Colors.grey : Colors.white,
                    ),
                    child: Text('서울캠퍼스', style: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedOption = 'b';
                        selectedSubOption = '';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary:
                          selectedOption == 'b' ? Colors.grey : Colors.white,
                    ),
                    child:
                        Text('글로벌캠퍼스', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              '2. 무엇을 기준으로 빈 강의실을 조회하시겠어요?',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedSubOption = 'c';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary:
                          selectedSubOption == 'c' ? Colors.grey : Colors.white,
                    ),
                    child: Text('건물별로 빈강의실 찾기',
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedSubOption = 'd';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary:
                          selectedSubOption == 'd' ? Colors.grey : Colors.white,
                    ),
                    child: Text('시간별로 빈강의실 찾기',
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              alignment: Alignment.center,
              child: Column(children: [
                Text(
                  '3. 아래에서 원하시는 건물 또는 교시를 선택해주세요.',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                ),
                _buildSelectedWidgets(),
              ]),
            ),
            Column(
              children: [
                if (isFinded)
                  Column(
                    children: [
                      Text(
                        '원하시는 빈강의실을 찾았습니다!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      //bottomText는 조건 만족으로 true 시 return되고, 빈강의실을 띄우는 박스와 헤더는 isFinded = true일 때 나타나게 함!
                      Text(bottomText),
                      RoomListHeader(isFinded),
                      LectureRoomList(isFinded),
                    ],
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedWidgets() {
    if (selectedOption == 'a' && selectedSubOption == 'c') {
      return seoul_building();
    } else if (selectedOption == 'a' && selectedSubOption == 'd') {
      return seoul_time();
    } else if (selectedOption == 'b' && selectedSubOption == 'c') {
      return global_building();
    } else if (selectedOption == 'b' && selectedSubOption == 'd') {
      return global_time();
    } else {
      return SizedBox.shrink();
    }
  }

  Widget global_building() {
    List<String> GlobalBuildingList = [
      '백년관',
      '어문학관',
      '교양관',
      '자연과학관',
      '인문경상관',
      '공학관'
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              for (int i = 0; i < GlobalBuildingList.length; i++)
                Column(
                  children: [
                    buildBuildingButton(
                      selectedGlobalBuilding,
                      selectedGlobalTime,
                      0,
                      i + 1,
                      GlobalBuildingList[i],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget global_time() {
    List<String> GlobalTimeList = [
      '1교시',
      '2교시',
      '3교시',
      '4교시',
      '5교시',
      '6교시',
      '7교시',
      '8교시',
      '9교시'
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              for (int i = 0; i < GlobalTimeList.length; i++)
                Column(
                  children: [
                    buildBuildingButton(
                      selectedGlobalBuilding,
                      selectedGlobalTime,
                      0,
                      i + 1,
                      GlobalTimeList[i],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget seoul_building() {
    List<String> SeoulBuildingList = [
      '본관',
      '인문과학관',
      '교수학습개발원',
      '사회과학관',
      '법학관',
      '사이버관'
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              for (int i = 0; i < SeoulBuildingList.length; i++)
                Column(
                  children: [
                    buildBuildingButton(
                      selectedSeoulBuilding,
                      selectedSeoulTime,
                      0,
                      i + 1,
                      SeoulBuildingList[i],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget seoul_time() {
    List<String> SeoulTimeList = [
      '1교시',
      '2교시',
      '3교시',
      '4교시',
      '5교시',
      '6교시',
      '7교시',
      '8교시',
      '9교시'
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              for (int i = 0; i < SeoulTimeList.length; i++)
                Column(
                  children: [
                    buildBuildingButton(
                      selectedSeoulBuilding,
                      selectedSeoulTime,
                      0,
                      i + 1,
                      SeoulTimeList[i], //text = 리스트의 인덱스 번호의 내용이 돰!!
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

//for문으로 생성하는 버튼의 인덱스 번호를 이용해, 클릭 시 회색으로 보이게 함
  Widget buildBuildingButton(int selectedBuilding, int selectedTime,
      int buildingNumber, int timeNumber, String text) {
    String buttonText = text; //버튼의 기본 텍스트

    //선택된 옵션과 조건에 따라 하단 텍스트 설정
    //나중에 실제 데이터 연결
    if (selectedOption == 'a' && selectedSubOption == 'c') {
      if (selectedBuilding == buildingNumber && selectedTime == timeNumber) {
        bottomText =
            "서울캠퍼스, 건물별로 빈강의실 찾기\n서울캠이면서 건물 고유번호가\n selectedBuilding == buildingNumber && selectedTime == timeNumber 를\n만족하는 정보를 출력해야함\n$text선택됨";
        isFinded = true;
      }
    } else if (selectedOption == 'a' && selectedSubOption == 'd') {
      if (selectedBuilding == buildingNumber && selectedTime == timeNumber) {
        bottomText =
            "서울캠퍼스, 시간별로 빈강의실 찾기\n서울캠이면서 교시 고유번호가\n selectedBuilding == buildingNumber && selectedTime == timeNumber 를\n만족하는 정보를 출력해야함\n$text선택됨";
        isFinded = true;
      }
    } else if (selectedOption == 'b' && selectedSubOption == 'c') {
      if (selectedBuilding == buildingNumber && selectedTime == timeNumber) {
        bottomText =
            "글로벌캠퍼스, 건물별로 빈강의실 찾기\n글로벌캠이면서 건물 고유번호가\n selectedBuilding == buildingNumber && selectedTime == timeNumber 를\n만족하는 정보를 출력해야함\n$text선택됨";
        isFinded = true;
      }
    } else if (selectedOption == 'b' && selectedSubOption == 'd') {
      if (selectedBuilding == buildingNumber && selectedTime == timeNumber) {
        bottomText =
            "글로벌캠퍼스, 시간별로 빈강의실 찾기\n글로벌캠이면서 교시 고유번호가\n selectedBuilding == buildingNumber && selectedTime == timeNumber 를\n만족하는 정보를 출력해야함\n$text선택됨";
        isFinded = true;
      }
    }

    return Container(
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedGlobalBuilding = buildingNumber;
            selectedSeoulBuilding = buildingNumber;
            selectedGlobalTime = timeNumber;
            selectedSeoulTime = timeNumber;
          });
        },
        style: ElevatedButton.styleFrom(
          primary:
              (selectedBuilding == buildingNumber && selectedTime == timeNumber)
                  ? Colors.grey
                  : Colors.white,
          padding: EdgeInsets.all(10),
        ),
        child: Text(text, style: TextStyle(color: Colors.black)),
      ),
    );
  }

  Widget LectureRoomList(bool isFinded) {
    if (!isFinded) {
      return SizedBox.shrink();
    }

//실제 데이터 연결 시, 정보 받아와서 찍어낼 수 있게
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: NeumorphicBox(
        child: Column(
          children: [
            for (int i = 0; i < lectureRoomCheckStates.length; i++)
              LectureRoomContainer(
                i,
                '0102', //실제 데이터로 대체
                '월', //실제 데이터로 대체
                '1, 2, 3, 4, 5', //실제 데이터로 대체
              ),
          ],
        ),
      ),
    );
  }

//맨 위의 체크, 강의실 번호 등 항목 row
  Widget RoomListHeader(bool isFinded) {
    if (!isFinded) {
      return SizedBox.shrink(); // isFinded가 false면 아무것도 보이지 않음
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Column(
        children: [
          NeumorphicBox(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  width: 80,
                  child: Text(
                    '체크',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Container(
                  width: 80,
                  child: Text(
                    '강의실',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Container(
                  width: 80,
                  child: Text(
                    '요일',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Container(
                  width: 80,
                  child: Text(
                    '시간(교시)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ]),
          ),
        ],
      ),
    );
  }

  Widget LikeRoomButton() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: NeumorphicButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LikeEmptyRoom(
                        //context: context,
                        selectedLectureRooms: selectedLectureRooms,
                      )));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('이미 즐겨찾는 빈강의실이 있다면?'),
                Text('여기를 눌러 즐겨찾기로 이동!',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            )));
  }
}
