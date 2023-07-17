import 'package:flutter/material.dart';
import 'package:hufs_information/Common_NeumorphicBox.dart';
import 'package:hufs_information/Common_paddingElement.dart';
import 'Common_InputText.dart';
import 'Common_LogoAppBar.dart';
import 'Common_SelectBox.dart';
import 'package:flutter/cupertino.dart';
import 'Common_CheckBox.dart';

//FormButton의 유효성 검사(InputText 3개 입력 & 체크박스 체크) 부분에서 상당한 에러가 발생함. 해당 부분 주석처리해둠!

class CreatingChat_Delivery extends StatefulWidget {
  @override
  _CreatingChatState createState() => _CreatingChatState();
}

class _CreatingChatState extends State<CreatingChat_Delivery> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  bool _checkboxChecked = false;
  bool _formValid = false;

  void _checkFormValid() {
    if (_titleController.text.isNotEmpty &&
        _costController.text.isNotEmpty &&
        _placeController.text.isNotEmpty &&
        _checkboxChecked) {
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

    return Scaffold(
      appBar: const LogoAppBar(),
      body: ListView(children: [
        InputText(labelText: '모임 제목을 입력해주세요.', textEditCtrl: _titleController),
        InfoBox(
            title: '배달비',
            subtext: '배달비 총액을 기재해주세요.',
            form: inputForm('원', _costController)),
        InfoBox(
            title: '수령 장소',
            subtext: '구성원들과 물품을 나눌 곳을 알려주세요.',
            form: inputForm('', _placeController)),
        InfoBox(
            title: '[참고] 최소 희망 인원',
            subtext: '최소 희망 인원이 충족되지 않아도 시작할 수 있습니다.',
            form: MinimumPeople()),
        InfoBox(
            title: '전화번호 공개 여부',
            subtext:
                '모임 내 구성원의 전화번호가 모두 공개됩니다.\n노쇼 방지를 위해 서로 주의를 필요로 할 때 유용합니다.',
            form: OpenSwitch()),
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
      onPressed: enabled ? () {} : null,
      child: Text('모임 생성',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: enabled ? Colors.blue : Colors.grey,
      ),
    ),
  );
}

/*
class FormButton extends StatelessWidget {

  @override
  Widget build (BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: Text('모임 생성', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        )
    );
  }
}
*/