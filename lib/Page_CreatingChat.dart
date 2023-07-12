import 'package:flutter/material.dart';
import 'Common_InputText.dart';
import 'Common_LogoAppBar.dart';
import 'Common_SelectBox.dart';
import 'package:flutter/cupertino.dart';
import 'Common_CheckBox.dart';
import 'Common_FormButton.dart';

//FormButton의 유효성 검사(InputText 3개 입력 & 체크박스 체크) 부분에서 상당한 에러가 발생함. 해당 부분 주석처리해둠!

class CreatingChat extends StatelessWidget {

  final TextEditingController value1Controller = TextEditingController();
  final TextEditingController value2Controller = TextEditingController();
  final TextEditingController value3Controller = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
      body: ListView(
        children: [
      writeYourChatName(),
      deliveryCost(), //[분리] 아래에 만들어둠
      getPlace(), //[분리]
      MinimumPeople(),//[분리]
      IsNotDuty(),//[분리]
      SizedBox(height:20),
      WillYouOpen(),
      forOurSafety(),
      GatherTime(),
      SizedBox(height: 16),
      BeCareFul(),
      SizedBox(height: 16),
      DoYouUnderstand(),
      SizedBox(height: 16),
      //FormButton에 문제가 있는게 확실하므로 고쳐야 함 ㅠㅠ....
      /*
      이런 식으로 InputText랑 checkBox 인자를 넘겨주려고 햇다는 것 참고하라고 남겨둠..!!
      일단 임시로 파란 버튼 그냥 만들어뒀엉
      FormButton(
            value1: value1Controller.text,
            value2: int.parse(value2Controller.text),
            value3: value3Controller.text,
            isChecked: _isChecked,
          ),
          */
      FormButton(),

      
        ]
      )
    );
  }

}

class writeYourChatName extends StatefulWidget {
  final TextEditingController value1Controller = TextEditingController();

  String value1 = '';

  @override
  _writeYourChatNameState createState() => _writeYourChatNameState();
}

class _writeYourChatNameState extends State<writeYourChatName> {
  @override
  Widget build(BuildContext context) {
    return InputText(
      labelText: '모임 제목을 입력해주세요.',
      onChanged: (value) {
        setState(() {
          widget.value1 = value;
        });
      },
      textEditCtrl: widget.value1Controller,
    );
  }
}


class deliveryCost extends StatelessWidget {

  final TextEditingController value2Controller = TextEditingController();
   int value2 = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          //'배달비'랑 InputText가 양끝으로 가게 expanded로 감쌈
          Expanded(
            child: Row(
              children: [
                Text(
                  '배달비',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          SizedBox(width: 16),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  InputText(labelText: '', labelWidth: 150, textEditCtrl: value2Controller, onChanged: (value)  {value2 = int.parse(value);}),
                  
                  Text('원'),
                
              ],
            ),
          ),

          
        ],
      ),
    );
  }
}

class getPlace extends StatelessWidget {

  final TextEditingController value3Controller = TextEditingController();
  String value3 = '';

  @override
  Widget build (BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Expanded(
            child: Row(children: [
              Text('수령 장소', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
            ],)
          ),

          Expanded(
            child: Row(
              children: [
                InputText(labelText: '', labelWidth: 200, textEditCtrl: value3Controller, onChanged: (value) { value3 = value;})
            ]),)
          ],)

      );

  }
}

class MinimumPeople extends StatefulWidget {
  @override
  _MinimumPeopleState createState() => _MinimumPeopleState();
}

class _MinimumPeopleState extends State<MinimumPeople> {
  int selectedValue = 1; //아무것도 안 눌렀을 때 값은 1로 정했음

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  '최소 희망 인원',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          //여기가 dropdown button 부분
          SelectInput(itemCount: 10, value: selectedValue,

            onChanged: (newValue) {
              setState(() {
                selectedValue = newValue; //새로 고른 값이 있다면 null인지 검사 후 값이 변경됨, 함수 속의 함수 꼴.
              });
            },

          ),
        ],
      ),
    );
  }
}

class IsNotDuty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Text(
            '최소 희망 인원이 충족되지 않아도 시작할 수 있습니다.',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}

//아이폰 on off 스위치 모양 만들기(cupertino라고 함, 맨 위에 import 했음!)
class WillYouOpen extends StatefulWidget {
  @override
  _WillYouOpenState createState() => _WillYouOpenState();
}

class _WillYouOpenState extends State<WillYouOpen> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
          Text('전화번호 공개 여부', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

          SizedBox(width: 16),

          //selectBox와 같은 로직이라고 생각하면 됨!
          CupertinoSwitch(
            value: _isSwitched,
            activeColor: CupertinoColors.activeBlue,
            onChanged: (bool value) {
              setState(() {
                _isSwitched = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class forOurSafety extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '모임 내의 구성원의 전화번호가 모두 공개됩니다.',
            style: TextStyle(fontSize: 15),
          ),
          Text(
            '노쇼 방지를 위해 서로 주의를 필요로 할 때 유용합니다.',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}

//시간을 설정하는 드롭박스가 들어가는 부분
class GatherTime extends StatefulWidget {
  @override
  _GatherTimeState createState() => _GatherTimeState();
}

class _GatherTimeState extends State<GatherTime> {
  int selectedHour = 00;
  int selectedMinute = 00;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  '모집 시간',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          Row(
            children: [
              // 시간 선택
              SelectInput(
                itemCount: 24,
                value: selectedHour,
                onChanged: (newValue) {
                  setState(() {
                    selectedHour = newValue ?? 00;
                  });
                },
              ),
              SizedBox(width: 8),

              Text('시'),
            ],
          ),
          Row(
            children: [
              // 분 선택
              SelectInput(
                itemCount: 59,
                value: selectedMinute,
                onChanged: (newValue) {
                  setState(() {
                    selectedMinute = newValue ?? 00;
                  });
                },
              ),

              SizedBox(width: 8),
              Text('분 까지'),
            ],
          ),
        ],
      ),
    );
  }
}

class BeCareFul extends StatelessWidget {
  get decoration => null;

@override
Widget build(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('주의사항', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            width: MediaQuery.of(context).size.width,

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('채팅방 개설 직후\n여러분은 "방장"으로서 모임을 책임지게 됩니다.'),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('모임 중 합의없는 노쇼 행위는\n다른 유저들에게 실망과 불편을 주는\n행위이므로 지양해주시고'),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('이는 신고 및 차단으로 이어질 수 있으며\nHUFS INFOGRAL에서\n불이익을 받으실 수 있습니다.'),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('유의하시어 책임감을 가져주시고\n보람찬 이용이 되시기를 바랍니다 :)'),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('-HUFS INFOGRAL 개발자 올림', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
}

class DoYouUnderstand extends StatefulWidget {
  @override
  _DoYouUnderstandState createState() => _DoYouUnderstandState();
}

class _DoYouUnderstandState extends State<DoYouUnderstand> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          Checkbox(
            value: _isChecked,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value ?? false;
              });
            },
          ),
          Text('주의사항을 올바르게 숙지하였습니다.'),
        ],
      ),
    );
  }
}








