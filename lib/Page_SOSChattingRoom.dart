import 'package:flutter/material.dart';
import 'Common_SnackBar.dart';
import 'package:provider/provider.dart';
import 'Common_Provider.dart';

class SOSChattingRoom extends StatefulWidget {
  //final ClickCountProvider clickCountProvider;
  final VoidCallback incrementClickCount; // 클릭 증가 함수 추가
  final int clickCount;
  final BuildContext context;
  const SOSChattingRoom(
      {required this.context,
      required this.incrementClickCount,
      Key? key,
      required this.clickCount})
      : super(key: key);

  @override
  _SOSChattingRoomState createState() => _SOSChattingRoomState();
}

//디자인 수정 완료

class _SOSChattingRoomState extends State<SOSChattingRoom> {
  int clickCount = 0; //클릭 횟
  void handleButtonClick() {
    //보통 예제에 나오듯이, 이렇게 하면 안됨!!
    // ClickCountProvider_Room clickCountProvider_room =
    //     Provider.of<ClickCountProvider_Room>(context, listen: false);

    // clickCountProvider_room.incrementClickCount();
    // int clickCount = clickCountProvider_room.clickCount;
    widget
        .incrementClickCount(); //이미 생성된 인스턴스를 사용하여 clickCount 업데이트. 인스턴스를 재생성하면, 당연히 clickCount 누적이 불가능함!
    clickCount = widget.clickCount + 1;
    setState(() {
      //int clickCount = widget.clickCount;
      print("Click count_Room: $clickCount");
      if (clickCount > 1) {
        showSnackbar(context, '신고는 한 번만 가능합니다!');
      } else {
        showSnackbar(context, '채팅방 신고가 완료되었습니다.\n신고 누적 시 이 채팅방의 입장이 제한됩니다.');
      }
    });
  }

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
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
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
        handleButtonClick();
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

void showCustomAlertDialog(
    BuildContext context, int clickCount, VoidCallback incrementClickCount) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return SOSChattingRoom(
        context: context,
        incrementClickCount: incrementClickCount,
        clickCount: clickCount,
      );
    },
  );
}
