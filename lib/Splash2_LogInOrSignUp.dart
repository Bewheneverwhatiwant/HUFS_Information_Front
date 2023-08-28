import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';
import 'Splash3_SignUp.dart';
import 'Common_paddingElement.dart';
import 'Splash1_Welcome.dart';
import 'Page_MainPage.dart';
import 'Common_SnackBar.dart';
import 'Page_MainPage.dart';

//두번째 스플래쉬, 로그인 또는 회원가입 화면
class Splash2_LogInOrSignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Splash2_LogInOrSignUpState();
}

class Splash2_LogInOrSignUpState extends State<Splash2_LogInOrSignUp> {
  TextEditingController _phoneNumberController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _phoneNumberController.addListener(_checkInput);
  }

  void _checkInput() {
    setState(() {
      //전화번호 11자리가 모두 입력됐는가?
      _isButtonEnabled = _phoneNumberController.text.length == 11;
    });
  }

  void _onSubmitButtonPressed() {
    String phoneNumber = _phoneNumberController
        .text; //text editing controller 객체. 즉 뭘 입력했는지를 가져옴

    if (_phoneNumberController.text.isEmpty && !_isButtonEnabled) {
      showSnackbar(context, '전화번호를 입력해주세요!');
    } else if (_phoneNumberController.text.length < 11 && !_isButtonEnabled) {
      showSnackbar(context, '전화번호 11자리를 모두 입력해주세요!');
    } else if (_phoneNumberController.text.length > 11 && !_isButtonEnabled) {
      showSnackbar(context, '전화번호를 정확히 입력해주세요!');
    } else if (!phoneNumber.contains(RegExp(r'^[0-9]+$'))) {
      //입력된 문자열(번호)이 숫자로만 구성되어있는지? (- 있으면 뜨게만듦)
      showSnackbar(context, '숫자만 입력해주세요!');
    } else {
      String phoneNumber = _phoneNumberController.text;
      if (phoneNumber == '01045957817' || phoneNumber == '01040694033') {
        showSnackbar(context, '계정이 있으시군요, 로그인되었습니다!');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MainPage(
                  context: context,
                  isButtonEnabled: false,
                )));
      } else {
        showSnackbar(context, '환영합니다, 새로운 유저님!');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Splash3_SignUp()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        //그라데이션 배경 만들기

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF29255A),
              Color(0xFF351553),
            ],
            begin: Alignment.topCenter, // 그라데이션 시작(화면 상단 중앙)
            end: Alignment.bottomCenter, // 그라데이션 종료(화면 하단 중앙)
          ),
        ),

        child: Center(
          child: paddingElement(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Image.asset('assets/images/Main_LogIn.png'),
                SizedBox(height: 30),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('전화번호 입력으로 간편하게 로그인하세요.',
                          style: TextStyle(color: Colors.white)),
                      Text('11자리의 숫자만 입력해주세요.',
                          style: TextStyle(color: Colors.white)),
                      Text('등록되지 않은 전화번호라면 회원가입 화면으로 이동합니다.',
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('전화번호', style: TextStyle(color: Colors.white)),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _phoneNumberController,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      hintText: '전화번호 입력',
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _onSubmitButtonPressed();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: _isButtonEnabled
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                  child: Text(
                                    '입력 완료',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(20),
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//버튼 함수. 소셜 로그인 때 구현해뒀던건데 삭제하긴 아까워서 주석처리...
// Widget createButtonWithImageAndTextAndNavigation(
//   String imagePath,
//   String buttonText,
//   VoidCallback onPressed,
// ) {
//   return Padding(
//     padding: EdgeInsets.all(10),
//     child: Container(
//       width: 300,
//       height: 50,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//         ),
//         child: Row(
//           children: [
//             Image.asset(imagePath),
//             SizedBox(width: 30),
//             Text(
//               buttonText,
//               style: TextStyle(color: Colors.black),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
