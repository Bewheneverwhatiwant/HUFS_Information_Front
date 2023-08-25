import 'package:flutter/material.dart';
import 'Common_SnackBar.dart';
import 'Common_RealChatContainer.dart';
import 'Common_SnackBar.dart';

//유저신고 페이지!!
//다른 유저 클릭 시 '메시지 블라인드' 버튼이 있고, 내가 방장이라면 블라인드 가능하도록 틀만 만들어둠
//실제 displayText를 다른 String('메시지가 블라인드되었습니다!')으로 바꿔지도록 하는 건 이제 해야됨

class UserSOS extends StatefulWidget {
  final BuildContext context;
  final bool isHost;
  const UserSOS({required this.context, required this.isHost, Key? key})
      : super(key: key);

  @override
  _UserSOSState createState() => _UserSOSState();
}

class _UserSOSState extends State<UserSOS> {
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
            //height: 250,
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
        showSnackbar(context, '이용자 신고가 완료되었습니다.\n신고 누적 시 이 유저의 활동이 제한됩니다.');
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
                ),
              )),
          Container(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    if (widget.isHost == true) {
                      //방장이면, 블라인드 권한을 부여
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('알림'),
                            content: Text('이제 이 사용자의 모든 메시지가 블라인드됩니다!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();

                                  showSnackbar(context, '블라인드 처리가 완료되었습니다.');
                                },
                                child: Text('확인'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                  showSnackbar(context, '블라인드 처리가 취소되었습니다.');
                                },
                                child: Text('취소'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      //방장이 아니면, 스낵바로 알려주기
                      showSnackbar(context,
                          '방장만 가능한 기능입니다.\n방장에게 이 유저의 메시지 블라인드를 요청하세요!');
                    }
                  },
                  child: Container(
                    height: 40,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '이 사용자의 모든 메시지 블라인드',
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}

void showCustomAlertDialog_user(BuildContext context, bool isHost) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return UserSOS(
        context: context,
        isHost: isHost, //방장 유무 정보 넘기기
      );
    },
  );
}
