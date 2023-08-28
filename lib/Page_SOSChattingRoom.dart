import 'package:flutter/material.dart';
import 'Common_SnackBar.dart';
import 'package:provider/provider.dart';
import 'Common_Provider.dart';

//clickCountProvider과 clickCountProvider_Room으로 provider를 따로 만들어두었으나, 현재 여기에 clickCountProvider_Room 연결 시
//provider를 찾을 수 없다는, context와 관련된 오류 발생 중이기 때문에
//일단 clickCountProvider로 돌려놓았음(오류만 안나도록). 나중에 분리해야함
//clickCountProvider는 유저신고 누적을 저장하는 provider, clickCountProvider_Room은 채팅방 신고 누적을 저장하는 provider
//유저가 특정 사용자/채팅방을 한번만 신고 가능하도록 구현하기 위해 만듦
//현재 상황은, 유저 신고와 채팅방 신고가 모두 clickCountProvider를 쓰고있으므로, 잘못된 스낵바 작동이 이루어지는 상태

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
  //int clickCount = 0; //신고를 한번으로 제한하기 위해

  void handleButtonClick() {
    ClickCountProvider_Room clickCountProvider_room =
        Provider.of<ClickCountProvider_Room>(context, listen: false);

    clickCountProvider_room.incrementClickCount();
    int clickCount = clickCountProvider_room.clickCount;

    print("Click count_Room: $clickCount");
    if (clickCount > 1) {
      //Navigator.of(context).pop();
      showSnackbar(context, '신고는 한 번만 가능합니다!');
    } else {
      //Navigator.of(context).pop();
      showSnackbar(context, '채팅방 신고가 완료되었습니다.\n신고 누적 시 이 채팅방의 입장이 제한됩니다.');
    }
  }

  @override
  Widget build(BuildContext context) {
    // ClickCountProvider_Room clickCountProvider_room =
    //     Provider.of<ClickCountProvider_Room>(context, listen: false);
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
      return ChangeNotifierProvider<ClickCountProvider_Room>(
        create: (context) => ClickCountProvider_Room(),
        child: SOSChattingRoom(
          context: context,
          clickCount: clickCount,
          incrementClickCount: incrementClickCount,
        ),
      );
    },
  );
}
