import 'package:flutter/material.dart';
import 'Common_SnackBar.dart';

class SOSChattingRoom extends StatefulWidget {
  final BuildContext context;
  const SOSChattingRoom({required this.context, Key? key}) : super(key: key);

  @override
  _SOSChattingRoomState createState() => _SOSChattingRoomState();
}

//디자인 수정 완료

class _SOSChattingRoomState extends State<SOSChattingRoom> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ModalBarrier(
          color: Colors.black.withOpacity(0.5),
          dismissible: false,
        ),
        Center(
          child: Container(
            width: 250,
            //height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            //padding: EdgeInsets.all(16.0),
            child: SOSDialog(),
          ),
        ),
      ],
    );
  }

  Widget createSOSButton(String buttonText) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
        showSnackbar(context, '채팅방 신고가 완료되었습니다. 신고 누적 시 채팅방 이용이 제한됩니다.');
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
      ),
      child: Container(
        height: 40,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget SOSDialog() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          createSOSButton('음란물/불건전한 만남 및 대화'),
          createSOSButton('낚시/놀람/도배'),
          createSOSButton('욕설/비하'),
          createSOSButton('정당/정치인 비하 및 선거운동'),
          createSOSButton('유출/사칭/사기'),
          createSOSButton('게시판 성격에 부적절함'),
          createSOSButton('상업적 광고 및 판매'),
          Container(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    showSnackbar(context, '신고가 취소되었습니다!');
                  },
                  child: Container(
                    height: 40,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '신고취소',
                        style: TextStyle(color: Colors.blue),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ))),
        ],
      ),
    );
  }
}

void showCustomAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return SOSChattingRoom(
        context: context,
      );
    },
  );
}
