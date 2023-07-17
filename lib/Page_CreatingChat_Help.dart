import 'package:flutter/material.dart';
import 'package:hufs_information/Common_NeumorphicBox.dart';
import 'package:hufs_information/Common_paddingElement.dart';
import 'Common_InputText.dart';
import 'Common_LogoAppBar.dart';
import 'Common_SelectBox.dart';
import 'package:flutter/cupertino.dart';
import 'Common_CheckBox.dart';
import 'Common_SnackBar.dart';

//마찬가지로, Creating chat Delivery의 파일을 복사 후 필요한 부분만 수정하여 제작함!
//HowCanIHelpYou의 TextField 부분에도, 같은 형식으로 TextEditController 적용 완료!!

class _CreatingChatState extends State<CreatingChat_Help> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _helpController = TextEditingController(); //추가!
  bool _checkboxChecked = false;
  bool _formValid = false;

  void _checkFormValid() {
    if (_titleController.text.isNotEmpty &&
        _costController.text.isNotEmpty &&
        _checkboxChecked &&
        _helpController.text.isNotEmpty) {

      setState(() {
        _formValid = true;
      });
    } else {
      setState(() {
        _formValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _titleController.addListener(_checkFormValid);
    _costController.addListener(_checkFormValid);
    _placeController.addListener(_checkFormValid);
    _helpController.addListener(_checkFormValid);

    return Scaffold(
      appBar: const LogoAppBar(),
      body: ListView(children: [
        InputText(labelText: '모임 제목을 입력해주세요.', textEditCtrl: _titleController),
        SizedBox(height: 10,),
        //도와줄 내용 작는 부분~다른 부분
        HowCanIHelpYou(helpController: _helpController, costController: _costController, placeController: _placeController,),
        InfoBox(
          title: '전화번호 공개 여부',
          subtext:
              '모임 내 구성원의 전화번호가 모두 공개됩니다.\n노쇼 방지를 위해 서로 주의를 필요로 할 때 유용합니다.',
          form: OpenSwitch(),
        ),
        InfoBox(title: '모집 시간', form: GatherTime()),
        notice(),
        paddingLR(
          Row(children: [
            CheckBox(
              onChanged: (bool? value) {
                setState(() {
                  _checkboxChecked = value ?? false;
                });
                _checkFormValid();
              },
            ),
            Text('주의사항을 올바르게 숙지하였습니다.')
          ]),
        ),
        SizedBox(height: 100),
      ]),
      bottomSheet: formButton(context, _formValid),
    );
  }
}

//추가한 부분!!

class CreatingChat_Help extends StatefulWidget {
  @override
  _CreatingChatState createState() => _CreatingChatState();
}

class HowCanIHelpYou extends StatelessWidget {
  HowCanIHelpYou({required this.helpController, required this.costController,
    required this.placeController});

  final TextEditingController helpController;
   final TextEditingController costController;
  final TextEditingController placeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        paddingLR(
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '상세 설명',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        SizedBox(height: 10),

        Container(
          width: 450,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: helpController, //TextController 추가
            keyboardType: TextInputType.multiline, //입력 양이 많으면, 엔터키를 사용하면서 내려갈 수 있는 키보드
            maxLines: null, //글 작성량 제한 x

            decoration: InputDecoration(
              labelText: '여기에 자세한 요청을 작성해주세요.',
              border: InputBorder.none, //플러터 기본 파란 input 테두리 숨기기
              contentPadding: EdgeInsets.all(8.0), //TextField 속 내용과 테두리 사이
            ),
            
          ),
        ),
        InfoBox(
          title: '사례, 보상',
          subtext: '사례가 꼭 돈일 필요는 없습니다. 하지만, 합리적인 보상이어야겠죠?',
          form: inputForm('', costController),
        ),
        InfoBox(
          title: '(선택)장소',
          subtext: '빈칸 입력 가능',
          form: inputForm('', placeController),
        ),
      ],
    );
  }
}

class InfoBox extends StatelessWidget {
  const InfoBox(
      {super.key, required this.title, required this.form, this.subtext = ''});

  final String title;
  final String subtext;
  final Widget form;

  @override
  Widget build(BuildContext context) {
    return paddingElement(Row(
      children: [
        Expanded(
            // 타이틀 영역
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(subtext)
          ],
        )),
        form
      ],
    ));
  }
}

Row inputForm(String unit, TextEditingController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      InputText(labelWidth: 150, textEditCtrl: controller),
      Text(unit),
    ],
  );
}

class MinimumPeople extends StatefulWidget {
  @override
  _MinimumPeopleState createState() => _MinimumPeopleState();
}

class _MinimumPeopleState extends State<MinimumPeople> {
  int selectedValue = 1; //아무것도 안 눌렀을 때 값은 1로 정했음

  @override
  Widget build(BuildContext context) {
    return SelectInput(
      itemCount: 10,
      value: selectedValue,
      onChanged: (newValue) {
        setState(() {
          selectedValue =
              newValue; //새로 고른 값이 있다면 null인지 검사 후 값이 변경됨, 함수 속의 함수 꼴.
        });
      },
    );
  }
}

//아이폰 on off 스위치 모양 만들기(cupertino라고 함, 맨 위에 import 했음!)
class OpenSwitch extends StatefulWidget {
  @override
  _OpenSwitch createState() => _OpenSwitch();
}

class _OpenSwitch extends State<OpenSwitch> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: _isSwitched,
      activeColor: CupertinoColors.activeBlue,
      onChanged: (bool value) {
        setState(() {
          _isSwitched = value;
        });
      },
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
              Text('시'),
              SizedBox(width: 8),
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
              Text('분 까지'),
            ],
          ),
        ],
      ),
    );
  }
}

Padding notice() {
  return paddingElement(const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('주의사항', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      SizedBox(
        height: 10,
      ),
      NeumorphicBox(
          width: 400,
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('채팅방 개설 직후\n여러분은 "방장"으로서 모임을 책임지게 됩니다.'),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child:
                    Text('모임 중 합의없는 노쇼 행위는\n다른 유저들에게 실망과 불편을 주는\n행위이므로 지양해주시고'),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                    '이는 신고 및 차단으로 이어질 수 있으며\nHUFS INFOGRAL에서\n불이익을 받으실 수 있습니다.'),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('유의하시어 책임감을 가져주시고\n보람찬 이용이 되시기를 바랍니다 :)'),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('-HUFS INFOGRAL 개발자 올림',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          )),
    ],
  ));
}

Widget formButton(BuildContext context, bool enabled) {
  return SizedBox(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.07,
    child: ElevatedButton(
      onPressed: enabled ? () {
        
        //'모임 생성' 버튼을 누르면, 토스트 메시지가 뜨면서 기존의 화면으로 돌아가게끔 작동을 추가함!!
              showSnackbar(context = context,'채팅방 생성이 완료되었습니다!');
              Navigator.of(context).pop();
      } : null,
      child: Text('모임 생성',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: enabled ? Colors.blue : Colors.grey,
      ),
    ),
  );
}

