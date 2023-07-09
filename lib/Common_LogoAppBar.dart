import 'package:flutter/material.dart';
import 'MainPage_CircleButton.dart';

class LogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LogoAppBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            CircleButton(onPressed: () => print('share버튼 클릭'), child: Image.asset('assets/images/Icon-share.png')),
            CircleButton(onPressed: () => print('setting버튼 클릭'), child: Image.asset('assets/images/Icon-setting.png')),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
