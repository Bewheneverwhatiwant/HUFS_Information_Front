import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Common_NeumorphicButton.dart';
import 'Gather_ChattingRoomList.dart';
import 'Page_CreatingChat_Delivery.dart';

//merge하면 999999% 충돌날 것 같음. 체크 필요...!

class AlertMessage extends StatelessWidget {
  final String title;
  final String place;
  final String plusInfo;
  final int peopleNum;
  final String dueTime;
  final bool isSwitched;

  //변수 넘겨주기
  AlertMessage({
    required this.title,
    required this.place,
    required this.plusInfo,
    required this.peopleNum,
    required this.dueTime,
    required this.isSwitched,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      //alert message가 뜨면 기존 화면 색상이 어둡게 바뀌기
      children: [
        ModalBarrier(
          color: Colors.black.withOpacity(0.5),
          dismissible: false, //alert message 바깥 클릭해도 창이 사라지지 않게 함
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(0),
            child: CupertinoAlertDialog(
              title: Column(
                children: [

                  Text(
                    '다음 모임에 참가하시겠습니까?',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 10),
                  Text(title), // 채팅방 제목 받아오기
                  SizedBox(height: 16),
                ],
              ),
              // 본문 부분
              content: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('기본 배달료:'),
                              Text(plusInfo, style:TextStyle(color: Colors.red)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('수령장소:'),
                              Text(place, style:TextStyle(color: Colors.blue)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("현재"),
                              Text(peopleNum.toString(), style:TextStyle(color: Colors.red)),
                              Text("명 참가중"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text((dueTime.toString()), style:TextStyle(color: Colors.blue)),
                              Text("까지 모집"),
                            ],
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [

                              Flexible(
                                child: Text(
                                  '전화번호',
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)
                                ),
                              ),

//creating chat 파일에 있는 cupertino button의 isSwitched 사용, 삼항연산자로 바/귀게 만듦~
          Flexible(
            child: Text(
              isSwitched ? '공개' : '비공개',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isSwitched ? Colors.green : Colors.red,
              ),
            ),
          ),

                                Flexible(
                                  child: Text('방')
                                  ,)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '방장과 본인의 전화번호가 모두 공개됩니다.',
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Text(
                                  '상호간의 노쇼 방지',
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('현재 포인트:', style:TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              Text('7000P', style:TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blue)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('차감 예정 포인트:', style:TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              Text('-300P', style:TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blue)),
                            ],
                          ),
                          Divider(height: 16, thickness: 1, color: Colors.black), // 검정색 수평선(구분선) 그리는 코드임
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('최종 포인트:', style:TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              Text('6700P', style:TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blue)),
                              
                            ],
                          ),

                          SizedBox(height:12),
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(4, 4),
                                          blurRadius: 12,
                                          color: Color(0xFFBECBD9),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text('모임에 입장하면 채팅방에 참가하여\n대화를 나누게 됩니다.'),
                                        ),
                                        SizedBox(height: 8),
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text('어플 내의 채팅 기능이 아닌\n외부 링크를 이용하여 대화를 할 경우'),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text('보이스피싱 및 기타 사기의\n위험이 있습니다.'),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text('이로 인한 피해 확인이 불가합니다.'),
                                        ),
                                        SizedBox(height: 8),
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text('이를 숙지 및 유의하시기를 바랍니다.'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // alert message 하단 버튼을 생성하는 부분임!
              // 버튼 추가 생성 시 Action을 추가하면 됨!
              actions: [
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("참가"),
                  onPressed: () {
                    Navigator.pop(context);
                    // 나중에 '참가' 버튼이 눌리면, 기존 화면으로 돌아간 후 거기서 만들어진 채팅방을 볼 수 있어야겠지?
                  },
                ),
                CupertinoDialogAction(
                  child: Text("취소"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
