import 'package:flutter/material.dart';
import 'package:hufs_information/Page_AlertMessage.dart';
import 'Common_LogoAppBar.dart';
import 'Page_AlertMessage.dart';
import 'Common_NeumorphicButton.dart';
import 'Common_NeumorphicBox.dart';
import 'Common_CheckBox.dart';

//gather help에서 채팅방을 누르면 나오는 구체적인 도움 내용을 띄우는 화면임!

class HowToHelpMe extends StatefulWidget {

  final String title;
  final String helpText;
  final String place;
  final String plusInfo;
  final int peopleNum;
  final String dueTime;
  final bool isSwitched;
  bool isIntermediatePage = false; //gather help는 도움 내용을 띄우는 화면이 중간에 필요함 -> 이 변수가 false면 바로 alert, true면 새 화면을 띄우게 함!!
                                   //반드시 꼭 false로 해줘야 함!! 아니면 아무리 실행해도 안보임..!

  HowToHelpMe({
    required this.title,
    required this.helpText,
    required this.place,
    required this.plusInfo,
    required this.peopleNum,
    required this.dueTime,
    required this.isSwitched,
    required this.isIntermediatePage,
  });

  @override
  _HowToHelpMeState createState() => _HowToHelpMeState();
}

class _HowToHelpMeState extends State<HowToHelpMe> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HelpTitle(),
            SizedBox(height: 30),
            //도와줄 내용을 띄우는 부분
            HelpLikeThis(),
            Spacer(), //밑으로 쭉 내려버리기!
            //체크박스
            DoYouUnderstand(),
            SizedBox(height: 30,),
            //alert message를 띄우게 넘어가는 버튼!!
            ClickHereToMoveAlert(context),
          ],
        ),
      ),
    );
  }

//클릭하면 alert message 화면으로 이동
  Row ClickHereToMoveAlert(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
               Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: isChecked ? Colors.blue : Colors.grey,
                  
                ),
              child: TextButton(
                onPressed: isChecked //체크박스가 체크가 되어야 넘어가는 버튼이 활성화
                    ? () {
                        if (!widget.isIntermediatePage) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) => AlertMessage(
                              title: widget.title,
                              place: widget.place,
                              plusInfo: widget.plusInfo,
                              peopleNum: widget.peopleNum,
                              dueTime: widget.dueTime,
                              isSwitched: widget.isSwitched,
                              context: context,
                            ),
                          );

                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HowToHelpMe(
                                title: widget.title,
                                place: widget.place,
                                peopleNum: widget.peopleNum,
                                plusInfo: widget.plusInfo,
                                isSwitched: widget.isSwitched,
                                helpText: widget.helpText,
                                dueTime: widget.dueTime,
                                isIntermediatePage: false,
                              ),
                            ),
                          );
                        }
                      }
                    : null, //비활

                    
                child: Container(
                  alignment: Alignment.center,
                  width: 130, height: 30,
                  child: Text(
                  '채팅방 입장하기',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                ),),
                
              ),
               ),
            ],
          );
  }

//체크박스(도움 내용을 이해했습니까?)
  NeumorphicBox DoYouUnderstand() {
    return NeumorphicBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CheckBox(
                      onChanged: (value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                    ),
                    Text('도움 요청을 이해하였습니다!'),
                  ],
                ),
              ],
            ),
          );
  }

//도움 채팅방 제목 가져오기
  NeumorphicBox HelpTitle() {
    return NeumorphicBox( 
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          );
  }

//실제 도움 내용 기입된 것
  NeumorphicBox HelpLikeThis() {
    return NeumorphicBox(
            height: 200,
            child: Text(
              // 프론트엔드에서는 서버와 연결되지 않으므로 실제 helpText를 확인할 수 없음
              // 서버 연동 시에 이 변수를 사용하면 됨
              '서버가 실제 help text를 보내줘야 함!!',
              style: TextStyle(fontSize: 16),
            ),
          );
  }
}
