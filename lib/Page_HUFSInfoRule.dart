import 'package:flutter/material.dart';
import 'Common_LogoAppBar_NoBack.dart';
import 'Common_paddingElement.dart';
import 'Common_NeumorphicBox.dart';
import 'Common_CheckBox.dart';
import 'Common_NeumorphicButton.dart';

//개인정보 동의 페이지

class HUFSInfoRule extends StatefulWidget {
  final BuildContext context;
  const HUFSInfoRule({required this.context, Key? key});

  @override
  _HUFSInfoRuleState createState() => _HUFSInfoRuleState();
}

class _HUFSInfoRuleState extends State<HUFSInfoRule> {
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;

  bool areAllChecked() {
    return checkbox1 && checkbox2 && checkbox3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar_NoBack(),
      body: paddingElement(
        Column(children: [
          Container(
            width: double.infinity,
            height: 150,
            child: NeumorphicBox(
              child: ListView(children: [
                Text(
                  'HUFS Infogral 이용약관1',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.red),
                ),
                Text(
                    '강자에게 더 세게 I love gamble\n과감할수록 신세계 on my table\nI’m sorry 세상이 원래 불공평해\nSo 더럽게 재미있지\nNow I move I move I move I move I move Go ahead\nI don’t look no look no look no look no look\nWhat’s in my hand I said go\nBaby 알잖아 내가 한 번 미치면 어디까지 가는지\n마지막 게임이니만큼 후회 없는 실수를 저질러\nI can’t die I’m all-in I can’t die I’m all-in'),
              ]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CheckBox(
                onChanged: (value) {
                  setState(() {
                    checkbox1 = value;
                  });
                },
              ),
              Text('스크롤을 내려 이용약관1을 읽고 동의합니다.')
            ],
          ),
          SizedBox(height: 15),
          Container(
              width: double.infinity,
              height: 150,
              child: NeumorphicBox(
                child: ListView(children: [
                  Text(
                    'HUFS Infogral 이용약관2',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.red),
                  ),
                  Text(
                      '강자에게 더 세게 I love gamble\n과감할수록 신세계 on my table\nI’m sorry 세상이 원래 불공평해\nSo 더럽게 재미있지\nNow I move I move I move I move I move Go ahead\nI don’t look no look no look no look no look\nWhat’s in my hand I said go\nBaby 알잖아 내가 한 번 미치면 어디까지 가는지\n마지막 게임이니만큼 후회 없는 실수를 저질러\nI can’t die I’m all-in I can’t die I’m all-in'),
                ]),
              )),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            CheckBox(
              onChanged: (value) {
                setState(() {
                  checkbox2 = value;
                });
              },
            ),
            Text('스크롤을 내려 이용약관2를 읽고 동의합니다.')
          ]),
          SizedBox(height: 15),
          Container(
              width: double.infinity,
              height: 150,
              child: NeumorphicBox(
                child: ListView(children: [
                  Text(
                    'HUFS Infogral 내부 개인정보 처리 방침3',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.red),
                  ),
                  Text(
                      '강자에게 더 세게 I love gamble\n과감할수록 신세계 on my table\nI’m sorry 세상이 원래 불공평해\nSo 더럽게 재미있지\nNow I move I move I move I move I move Go ahead\nI don’t look no look no look no look no look\nWhat’s in my hand I said go\nBaby 알잖아 내가 한 번 미치면 어디까지 가는지\n마지막 게임이니만큼 후회 없는 실수를 저질러\nI can’t die I’m all-in I can’t die I’m all-in'),
                ]),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CheckBox(
                onChanged: (value) {
                  setState(() {
                    checkbox3 = value;
                  });
                },
              ),
              Text('스크롤을 내려 이용약관3을 읽고 동의합니다.')
            ],
          ),
          Spacer(),
          Container(
            width: double.infinity,
            child: NeumorphicButton(
              onPressed: areAllChecked()
                  ? () {
                      Navigator.pop(context);
                    }
                  : null,
              child: Text('확인'),
            ),
          ),
          SizedBox(height: 10)
        ]),
      ),
    );
  }
}
