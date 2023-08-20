import 'package:flutter/material.dart';
import 'Page_MainPage.dart';
import 'Common_paddingElement.dart';
import 'Common_CheckBox.dart';
import 'Common_SnackBar.dart';
import 'Page_PersonalInfo.dart';
import 'Page_HUFSInfoRule.dart';

//나중에 전화번호 인증&&닉네임 통과 시 회원가입 완료!가 활성화되도록 바꿔야 함!

class Splash3_SignUp extends StatefulWidget {
  @override
  _Splash3_SignUpState createState() => _Splash3_SignUpState();
}

class _Splash3_SignUpState extends State<Splash3_SignUp> {

  bool _agreePersonalInfo = false; //개인정보 처리 방침 동의?
  bool _agreeHUFSInfoRule = false; //이용 약관 동의?
  String? _phoneNumber;
  String? _nickName;
  bool _isSignUpButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF29255A),
              Color(0xFF351553),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: paddingElement(
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Image.asset('assets/images/Main_Welcome.png'),
              SizedBox(height: 30),
              Text(
                '처음 이용하시는군요!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '아래의 간단한 정보를 입력하신 뒤\n바로 어플을 즐겨보세요',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              Spacer(),

              //전화번호 입력 및 입력인식
              writePhoneNumber(
                onChanged: (phoneNumber) {
                  setState(() {
                    _phoneNumber = phoneNumber;
                  });
                  _checkSignUpButtonStatus();
                },
              ),
              SizedBox(height: 20),

              //닉네임 입력 및 입력인식
              writeNickName(
                onChanged: (nickName) {
                  setState(() {
                    _nickName = nickName;
                  });
                  _checkSignUpButtonStatus();
                },
              ),
              SizedBox(height: 20),

              //개인정보 처리 방침 동의
              AgreePersonalInfo(
                onChanged: (isChecked) {
                  setState(() {
                    _agreePersonalInfo = isChecked;
                    _checkSignUpButtonStatus();
                  });
                },
              ),
              SizedBox(height: 20),

              //이용약관 동의
              AgreeHUFSInfoRule(
                onChanged: (isChecked) {
                  setState(() {
                    _agreeHUFSInfoRule = isChecked;
                    _checkSignUpButtonStatus();
                  });
                },
              ),
              SizedBox(height: 20),

              //회원가입 완료! 버튼
              doYouWannaSignUp(
                onPressed: _isSignUpButtonEnabled
                    ? () {
                        //회원가입 완료 버튼을 누르면 홈화면으로 이동
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MainPage(
                            context: context,
                            isButtonEnabled: false,
                          ),
                        )
                        );
                        showSnackbar(context, '회원가입에 성공하였습니다!');
                      }
                    : null,
              ),
              SizedBox(height:30),
            ],

          ),

        ),
      ),

      Positioned(
            top: 20,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
      
      ],
      ),
    );
  }

//전화번호, 닉네임, 개인정보 체크, 이용약관 체크 시 회원가입 완료버튼이 활성화되도록 하는 유효성 검서 메소드
  void _checkSignUpButtonStatus() {
    if (_agreePersonalInfo && _agreeHUFSInfoRule && _phoneNumber != null && _nickName != null) {
      setState(() {
        _isSignUpButtonEnabled = true;
      });
    } else {
      setState(() {
        _isSignUpButtonEnabled = false;
      });
    }
  }
}

//전화번호 입력
class writePhoneNumber extends StatefulWidget {
  final ValueChanged<String?> onChanged;
  writePhoneNumber({Key? key, required this.onChanged}) : super(key: key);

  @override
  _writePhoneNumberState createState() => _writePhoneNumberState();
}

class _writePhoneNumberState extends State<writePhoneNumber> {
  String? _phoneNumber;

  @override
  Widget build(BuildContext context) {
    void _checkSignUpButtonStatus() {
      if (_phoneNumber != null && _phoneNumber != null) {
        widget.onChanged(_phoneNumber); //onChanged 콜백 호출
      }
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('전화번호', style: TextStyle(color: Colors.white),),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _phoneNumber = value;
                    });
                    widget.onChanged(_phoneNumber); //onChanged 콜백 호출
                    _checkSignUpButtonStatus(); //checkSignUpButtonStatus 호출
                  },
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  //인증 버튼 눌렀을 때 동작
                },
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
          ),
        ),
                child: Text('인증', style: TextStyle(color: Colors.black),),
              ),
            ],
          ),
        ],

      ),
    );

  }
}

//닉네임 입력
class writeNickName extends StatefulWidget {
  final ValueChanged<String?> onChanged;
  writeNickName({Key? key, required this.onChanged}) : super(key: key);

  @override
  _writeNickNameState createState() => _writeNickNameState();
}

class _writeNickNameState extends State<writeNickName> {
  String? _nickName;

  @override
  Widget build(BuildContext context) {
    void _checkSignUpButtonStatus() {
      if (_nickName != null && _nickName != null) {
        widget.onChanged(_nickName);
      }
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('닉네임', style: TextStyle(color: Colors.white),),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _nickName = value;
                    });
                    widget.onChanged(_nickName); 
                    _checkSignUpButtonStatus(); 
                  },
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  // 중복 확인 버튼 눌렀을 때 동작
                },
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
          ),
        ),
                child: Text('중복 확인', style: TextStyle(color:Colors.black),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//개인정보 동의 체크박스
class AgreePersonalInfo extends StatefulWidget {
  final ValueChanged<bool> onChanged;

  AgreePersonalInfo({required this.onChanged});

  @override
  _AgreePersonalInfoState createState() => _AgreePersonalInfoState();
}

class _AgreePersonalInfoState extends State<AgreePersonalInfo> {
  bool _agreePersonalInfo = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => PersonalInfo(context: context)));},
          child: Text(
            '개인정보처리방침',
            style: TextStyle(
              decoration: TextDecoration.underline, //그 글자에 밑중있고 누를 수 있는 그거
              color: Colors.red,
            ),
          ),
        ),
        Text('을 확인하였으며, 이에 동의합니다.', style: TextStyle(color: Colors.white),),
        Checkbox(
          onChanged: (isChecked) {
            setState(() {
              _agreePersonalInfo = isChecked!;
              widget.onChanged(_agreePersonalInfo);
            });
          },
          value: _agreePersonalInfo,
        ),
      ],
    );
  }
}

//이용약관 동의 체크크
class AgreeHUFSInfoRule extends StatefulWidget {
  final ValueChanged<bool> onChanged;

  AgreeHUFSInfoRule({required this.onChanged});

  @override
  _AgreeHUFSInfoRuleState createState() => _AgreeHUFSInfoRuleState();
}

class _AgreeHUFSInfoRuleState extends State<AgreeHUFSInfoRule> {
  bool _agreeHUFSInfoRule = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => HUFSInfoRule(context: context)));},
          child: Text(
            '이용약관',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.red,
            ),
          ),
        ),
        Text('을 확인하였으며, 이에 동의합니다.', style: TextStyle(color: Colors.white),),
        Checkbox(
          onChanged: (isChecked) {
            setState(() {
              _agreeHUFSInfoRule = isChecked!;
              widget.onChanged(_agreeHUFSInfoRule);
            });
          },
          value: _agreeHUFSInfoRule,
        ),
      ],
    );
  }
}

//찐 최종 회원가입 할래?
class doYouWannaSignUp extends StatelessWidget {
  final VoidCallback? onPressed;

  doYouWannaSignUp({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.white, width: 2), //테두리 색, 두께
          ),
        ),
        onPressed: onPressed,
        child: Text(
          '회원가입 완료!',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
