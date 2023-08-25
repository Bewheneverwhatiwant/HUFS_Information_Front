import 'package:flutter/material.dart';
import 'package:hufs_information/Common_NeumorphicButton.dart';
import 'package:hufs_information/Page_MainPage.dart';
import 'Common_LogoAppBar_NoBack.dart';
import 'Common_paddingElement.dart';
import 'Common_NeumorphicBox.dart';
import 'Gather_ChattingRoomList.dart';
import 'Page_AlertMessage.dart';
import 'Common_SnackBar.dart';
import 'Common_WriteChatText.dart';
import 'Common_RealChatList.dart';
import 'Common_RealChatContainer.dart';

//진짜 채팅하는 채팅방을 구현한 파일!

class ChattingRoom extends StatefulWidget {
  //참가확정시 사람 아이콘 색이 변하게 되므로 stateful로 함

  final BuildContext context;
  final String title;
  final int type; //배달, 택시, 도움 중 하나

  const ChattingRoom(
      {required this.context,
      required this.title,
      required this.type,
      Key? key});

  @override
  _ChattingRoomState createState() => _ChattingRoomState();
}

class _ChattingRoomState extends State<ChattingRoom> {
  //플러터 아이콘 중 사람 모양 아이콘 사용!
  List<IconData> icons = [
    Icons.person,
    Icons.person,
    Icons.person,
    Icons.person,
    Icons.person,
  ];

  int confirmedCount = 0; //아이콘 옆에 참가확정 현황을 숫자로 띄우기 위해 둔 변수
  bool isButtonEnabled = true;
  bool isButtonAEnabled = true; // '참가확정' 버튼 활성화 상태 변수
  bool isButtonBEnabled = true; // '나가기' 버튼 활성화 상태 변수
  bool isButtonCEnabled = false; // '함께 약속한 내용 완료!' 상태 관리 변수
  bool isAllAgree = false; // 모든 참가자 동의 여부 상태 변수
  int isDone = 0; //약속한 내용 완료?

  List<ChatMessageContainer> _convertMessages(List<ChatMessage> messages) {
    return messages
        .where((message) => message.type == widget.type)
        .map((message) => ChatMessageContainer(
              nickName: message.nickName,
              displayText: message.displayText,
              sentTime: message.sentTime,
              isMe: message.isMe,
              isHost: message.isHost,
            ))
        .toList();
  }

//화면 상단과 하단 부분은 항상 고정하고, 중간의 채팅 부분만 스크롤 가능하도록 수정함
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar_NoBack(),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                notice(), //안내사항
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                RealChatContainer(messages: _convertMessages(messages)),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Divider(),
                SizedBox(height: 5),
                WriteChatText(
                  displayText: '',
                  onTextSubmitted: (String value) {},
                ), //채팅을 입력하는 입력창
                wait(), //참가자 수 아이콘과 안내사항
                WillYouJoinChat(), //참가확정 등 버튼 네가지
              ],
            ),
          ),
        ],
      ),
    );
  }

  //아래에서부터 구체적인 코드 진행

//하단의 네가지 버튼을 만듦
  Padding WillYouJoinChat() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //'함께 약속한 내용 완료!' 버튼을 생성하는 부분
                Container(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: isButtonCEnabled
                          ? () {
                              setState(() {
                                isButtonCEnabled =
                                    false; //false, true 바꿔서 '나가기' 버튼 작동 여부(isDone==icons.length일 때 활성화되는지) 테스트 가능
                                showSnackbar(context, '함께 약속한 내용을 완료하였어요!');
                                isDone++; //클릭 시 변수 카운트
                                if (isDone == icons.length) {
                                  isButtonBEnabled = true;
                                }
                              });
                            }
                          : null,
                      child: Text(
                        '함께 약속한 내용 완료!',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      style: makeButtonStyle(isButtonCEnabled)),
                ),
                SizedBox(width: 10),

                //방장에게 탈퇴 요청하기 버튼을 생성하는 부분
                Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        showSnackbar(context, '방장에게 탈퇴 요청을 보냈습니다!');
                      },
                      child: Text(
                        '방장에게 탈퇴 요청하기',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.red,
                        ),
                      ),

                      //isButtonEnabled 변수가 필요한 버튼은 아니라서, 맨 하단에 정의해둔 MakeButtonStyle 메소드를 사용하지 않고 그냥 작성했음
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.all(15.0),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.transparent),
                          ),
                        ),
                        elevation: MaterialStateProperty.all<double>(3.0),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (states) {
                            return Colors.white;
                          },
                        ),
                      ),
                    )),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //'참가확정' 버튼을 생성하는 부분
                Container(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: isButtonAEnabled
                          ? () {
                              setState(() {
                                isButtonAEnabled =
                                    false; //'참가확정' 버튼 클릭 시 '참가확정' 버튼을 비활성화하여 한번만 클릭 가능하도록 함
                                isButtonBEnabled =
                                    false; //'참가확정' 버튼 클릭 시 '나가기' 버튼 비활성화
                                isButtonCEnabled =
                                    true; //'참가확정' 버튼 클릭 시 '함께 약속한 내용 완료!' 버튼이 활성화
                                showSnackbar(context, '채팅방 참가가 확정되었습니다!');

                                //'참가확정' 버튼 클릭 시 아이콘이 하나씩 파랗게 변함
                                for (int i = 0; i < icons.length; i++) {
                                  if (icons[i] == Icons.person) {
                                    icons[i] = Icons.person_outline;
                                    confirmedCount++;
                                    break;
                                  }
                                }
                              });
                            }
                          : null, //비활성화 상태일 때 onPressed를 null로 설정하여 버튼을 비활성화
                      child: Text(
                        '참가확정',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black, //버튼 색상 조정
                        ),
                      ),
                      style: makeButtonStyle(isButtonAEnabled)),
                ),
                SizedBox(width: 10),

                //'나가기' 버튼을 생성하는 부분
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        //만약 '참가확정' 버튼을 안 누른 상태에서 '나가기' 버튼을 누르면? (isButtonAEnabled = true 일 때)
                        if (isButtonAEnabled) {
                          showSnackbar(context,
                              '채팅방 참가가 취소되었습니다!'); //참가를 확정하지 않았다면, 나가기 가능!
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => MainPage(
                                        context: context,
                                        isButtonEnabled: isButtonEnabled,
                                      )),
                              (route) => false);
                          //나가기 버튼 클릭 시 홈화면으로 이동
                        }

                        //'참가확정' 버튼을 눌러서 '나가기' 버튼이 비활성화된 상태에서 '나가기' 버튼을 누르면? (isButtonAEnabled = false 일 때)
                        else if (isDone < icons.length) {
                          showSnackbar(
                              context, '아직 모든 참가자가 모집 종료에 동의하지 않았습니다!');
                        }
                        //'참가확정' 버튼을 눌러서 '나가기' 버튼이 비활성화 됐다가, 모든 사람이 '함께 약속한 내용 완료' 버튼을 눌러서 다시 활성화 된 후 '나가기' 버튼을 누르면?
                        else if (isDone == icons.length) {
                          isButtonBEnabled = true;
                          showSnackbar(context, '모임이 끝났습니다!');
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => MainPage(
                                        context: context,
                                        isButtonEnabled: isButtonEnabled,
                                      )),
                              (route) => false);
                          //나가기 버튼 클릭 시 홈화면으로 이동
                        }
                      },
                      child: Text(
                        '나가기',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      style: makeButtonStyle(isButtonBEnabled)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//appBar 밑에 안내사항(?)
  Padding notice() {
    return paddingElement(
      NeumorphicBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text('채팅방입니다.'),
              ],
            ),
            Text('채팅방 이용 중 다른 채팅방 이용은 불가능합니다.'),
            SizedBox(
              height: 10,
            ),
            Text(
              '외부 링크 유도 시 사기 위험이 있으니 주의하세요!',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

//사람모양 아이콘이 있음
  Padding wait() {
    return paddingElement(
      NeumorphicBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  //아이콘 list 개수만큼 사람모양이 생성됨
                  children: List.generate(
                    icons.length,
                    (index) => Icon(
                      icons[index],
                      //참가확정 버튼을 클릭하면 아이콘이 파란색으로 변함
                      color: icons[index] == Icons.person
                          ? Colors.black
                          : Colors.blue,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '$confirmedCount/${icons.length}', //파란색으로 변한 아이콘만큼, icon list 옆의 숫자 증가(현재 확정 인원수)
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('모든 인원이 참가확정을 하면, 모집이 종료되며,'),
                Text('배달 종료 시까지 방을 나갈 수 없습니다.'),
                Text('전화번호 공개 방의 경우, 모집 종료 이후에 서로의 전화번호가 노출됩니다.'),
              ],
            )
          ],
        ),
      ),
    );
  }

//각 버튼의 스타일을 만드는 코드. isButtonEnabled에 isButtonAEnabled 등으로 넣어주면 됨
//기존의 Neumorphic 버튼을 상속받기에는, '나가기' 버튼에서, 회색을 부여하고싶을 때, null이 아니라 특정 기능을 기준으로 삼아야 했기 때문에
//디자인을 새로 지정해주었음(하단의 네 버튼의 디자인 통일성을 위해)
  ButtonStyle makeButtonStyle(bool isButtonEnabled) {
    return ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.all(15.0),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.transparent),
        ),
      ),
      elevation: MaterialStateProperty.all<double>(3.0),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (states) {
          if (isButtonEnabled) {
            return Colors.white;
          } else {
            return Colors.grey;
          }
        },
      ),
    );
  }
}
