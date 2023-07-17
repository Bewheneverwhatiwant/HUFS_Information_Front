import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList(
      {required this.text, this.isTitle = false, this.onPressed, this.lockAvailable = false,}); //전체보기 메뉴버튼에도 lock 걸려고 수정함!!

  final VoidCallback? onPressed;
  final String text;
  final bool isTitle;
  final bool lockAvailable; //변수 추가(전체 메뉴 버튼에 잠금 할건지? 말건지? 변수임)

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

          //아래 부분 많이 수정함!!

        : Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Row(

                    //잠금기능 및 아이콘 삽입 가능한 부분
                    children: [
                      Text(text),
                      if (lockAvailable)
                        const SizedBox(width: 8.0),
                        
                      if (lockAvailable)
                        const Icon(Icons.lock, color: Colors.grey),
                    ],
                  ),

                  onTap: onPressed,
                ),
              ),
              const Icon(Icons.arrow_forward),
              SizedBox(width: 30),
            ],
          );
  }
}
