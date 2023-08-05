import 'package:flutter/material.dart';
import 'package:hufs_information/Common_NeumorphicButton.dart';
import 'Common_LogoAppBar.dart';
import 'Common_paddingElement.dart';
import 'Common_NeumorphicBox.dart';
import 'Gather_ChattingRoomList.dart';
import 'Page_AlertMessage.dart';
import 'Common_SnackBar.dart';
import 'Common_WriteChatText.dart';
import 'Common_RealChatList.dart';

//진짜 채팅하는 채팅방을 구현한 파일!

class ChattingRoom extends StatefulWidget { //참가확정시 사람 아이콘 색이 변하게 되므로 stateful로 함

  final BuildContext context;
  final String title;

  const ChattingRoom({required this.context, required this.title, Key? key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
      body: Column(
        children: [
          notice(), //밑에 있음
          RealChatList(chatMessages: [],), //입력된 채팅들을 담는 컨테이너
          Spacer(), //버튼을 맨 밑으로 내리기 위한 공간확보? 그런것
          WriteChatText(displayText: '', onTextSubmitted: (String value) {  },), //채팅을 입력하는 입력창
          wait(), //밑에 있음
          WillYouJoinChat(), //밑에 있음
        ],
      ),
    );
  }

//참가확정 or 취소 버튼
  Padding WillYouJoinChat() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            child: NeumorphicButton(
              onPressed: isButtonEnabled ? () {
                setState(() {

                  //클릭 시 버튼 비활성화(중복 클릭 방지)
                  isButtonEnabled = false;
                  showSnackbar(context, '채팅방 참가가 확정되었습니다!');
                  for (int i = 0; i < icons.length; i++) {
                    if (icons[i] == Icons.person) {
                      icons[i] = Icons.person_outline;
                      confirmedCount++;
                      break;
                    }
                  }
                });
              } : null, //비활성화 상태일 때 onPressed를 null로 설정하여 버튼을 비활성화
              child: Text(
                '참가확정',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, //버튼 색상 조정
                  
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          SizedBox(
            width: 150,
            child: NeumorphicButton(
              onPressed: () {
                showSnackbar(context, '채팅방 참가가 취소되었습니다!');
                Navigator.popUntil(context, (route) => route.isFirst || route.settings.name == '/Page_MainPage'); //나가기!
              },
              child: Text(
                '나가기',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
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
                color: icons[index] == Icons.person ? Colors.black : Colors.blue,
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
      ],)



        ],
    ),
    
    ),
  );
}


}
