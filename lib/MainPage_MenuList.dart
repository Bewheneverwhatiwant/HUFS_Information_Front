import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList(
      {required this.text, this.isTitle = false, this.onPressed = null});

  final VoidCallback? onPressed;
  final String text;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return isTitle
        ? Column(
            // 메뉴가 제목이라면, 제목을 표시하고 아래에 구분선 생성
            children: <Widget>[
              ListTile(
                // ListTile로 제목 표시
                title: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Divider(), // 구분선 생성
            ],
          )
        : GestureDetector(
            // 제목이 아니라면, 메뉴를 표시하고 아이콘 생성
            onTap: onPressed,
            child: Row(
              children: [
                Expanded(child: ListTile(title: Text(text))), // ListTile로 메뉴 표시
                const Icon(Icons.arrow_forward), // 아이콘 생성
                SizedBox(width: 30) // 아이콘 우측 여백 생성
              ],
            ),
          );
  }
}
