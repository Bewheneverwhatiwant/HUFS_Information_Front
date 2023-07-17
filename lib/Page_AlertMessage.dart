import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hufs_information/Common_NeumorphicBox.dart';
import 'Common_NeumorphicButton.dart';
import 'Gather_ChattingRoomList.dart';
import 'Page_CreatingChat_Delivery.dart';
import 'Page_ChattingRoom.dart';
import 'Common_SnackBar.dart';

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
          child: alertDialog(context), //[분리] Diaglog 창 구현
        ),
      ],
    );
  }

  Widget alertDialog(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
        barBackgroundColor: Colors.white,
      ),
      child: CupertinoAlertDialog(
        title: buildTitle(), // 제목 부분
        content: buildContent(), // 본문 부분
        actions: buildActions(context), // alert message 하단 버튼. 버튼 추가 생성 시 Action 추가
      ),
    );
  }

  Column buildTitle() {
    return Column(
      children: [
        Text('다음 모임에 참가하시겠습니까?', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
        SizedBox(height: 10),
        Text(title), // 채팅방 제목 받아오기
        SizedBox(height: 16),
      ],
    );
  }

  Widget buildContent() {
    FontWeight bold = FontWeight.bold;
    return SingleChildScrollView(
      child: Column(
        children: [
          // infoRowEnd/Start 는 하단에 분리된 메소드로, 텍스트 -> 색상 -> 굵기 순서대로 리스트를 받아 매핑함.
          infoRowEnd(['기본 배달료: ', plusInfo], [null, Colors.red], [bold, bold]),
          infoRowEnd(['수령장소: ', place], [null, Colors.blue], [bold, bold]),
          infoRowStart(["현재 ", peopleNum.toString(), "명 참가중"], [null, Colors.red, null], [null, bold, null]),
          infoRowStart([dueTime, " 까지 모집"], [Colors.blue, null], [bold, null]),
          infoPhoneOpen(),
          infoCurrentPoint(7000),
          infoWarning(),
        ],
      ),
    );
  }

  Column infoPhoneOpen() {
    FontWeight bold = FontWeight.bold;
    FontWeight superbold = FontWeight.w900;
    return Column(
      children: [
        infoRowEnd(['전화번호 ', isSwitched ? '공개' : '비공개', ' 방'], [null, isSwitched ? Colors.green : Colors.red, null],
            [bold, bold, null]),
        const Align(
          alignment: Alignment.centerRight,
          child:
              Text('방장과 본인의 전화번호가 모두 공개됩니다.\n상호간의 노쇼 방지', textAlign: TextAlign.right, style: TextStyle(fontSize: 10)),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Column infoCurrentPoint(int currentPoint) {
    Row pointInfo(text, point) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          Text('$point P', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blue)),
        ],
      );
    }

    return Column(
      children: [
        pointInfo('현재 포인트: ', currentPoint),
        pointInfo('차감 예정 포인트: ', -300),
        Divider(height: 16, thickness: 1, color: Colors.black), // 검정색 수평선(구분선) 그리는 코드임
        pointInfo('최종 포인트: ', currentPoint - 300),
        SizedBox(height: 12),
      ],
    );
  }

  Widget infoWarning() {
    List<String> messages = [
      '모임에 입장하면 채팅방에 참가하여 대화를 나누게 됩니다.',
      '',
      '어플 내의 채팅 기능이 아닌 외부 링크를 이용하여 대화를 할 경우, 보이스피싱 및 기타 사기의 위험이 있습니다.',
      '',
      '이 경우, 피해 확인이 불가하므로\n기타 연락 수단은 자제바랍니다.'
    ];

    return NeumorphicBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: messages
            .map((message) => Text(
                  message,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black),
                ))
            .toList(),
      ),
    );
  }

  List<Widget> buildActions(BuildContext context) {
    return [
      CupertinoDialogAction(
        isDefaultAction: true,
        child: const Text("참가", style: TextStyle(fontWeight: FontWeight.bold)),
        onPressed: () {
          //이 부분을 수정함!!
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChattingRoom(context: context, title: title)));
          showSnackbar(context, '성공적으로 입장하셨습니다!');
        },
      ),
      CupertinoDialogAction(
        child: const Text("취소", style: TextStyle(fontWeight: FontWeight.bold)),
        onPressed: () {
          Navigator.pop(context);
          showSnackbar(context, '채팅방 입장이 취소되었습니다!');
        },
      ),
    ];
  }

  Row infoRowEnd(List<String> texts, List<Color?> colors, List<FontWeight?> weights) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: texts
          .asMap()
          .entries
          .map((entry) => Text(entry.value,
              style: TextStyle(color: colors[entry.key], fontWeight: weights[entry.key] ?? FontWeight.normal)))
          .toList(),
    );
  }

  Row infoRowStart(List<String> texts, List<Color?> colors, List<FontWeight?> weights) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: texts
          .asMap()
          .entries
          .map((entry) => Text(entry.value,
              style: TextStyle(color: colors[entry.key], fontWeight: weights[entry.key] ?? FontWeight.normal)))
          .toList(),
    );
  }
}
