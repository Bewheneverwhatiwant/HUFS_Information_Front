import 'package:flutter/material.dart';
import 'MainPage_CircleButton.dart';
import 'Page_Share.dart';

class LogoAppBar_NoBack extends StatelessWidget implements PreferredSizeWidget {
  const LogoAppBar_NoBack({Key? key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, //메인 화면과 채팅방에서만 뒤로가기 버튼 제거!
      iconTheme: const IconThemeData(color: Colors.black), // 뒤로가기 검은색으로
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Row(
            children: [
              Image.asset('assets/images/Icon-AppBar.png'),
              Image.asset('assets/images/Icon-AppBar-HUFSinfogral.png'),
            ],
          ),
          Expanded(
            child: Container(), //두 컨테이너 사이에 공간을 만들기 위한 빈 컨테이너
          ),
        ],
      ),

      actions: [
        Row(
          children: [
            CircleButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Share(context: context)));
                },
                child: Image.asset('assets/images/Icon-share.png')),
            CircleButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Share(context: context)));
                },
                child: Image.asset('assets/images/Icon-setting.png')),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
