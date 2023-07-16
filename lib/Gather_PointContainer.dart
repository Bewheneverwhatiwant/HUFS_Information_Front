import 'package:flutter/material.dart';
import 'package:hufs_information/Common_NeumorphicButton.dart';
import 'package:hufs_information/Common_paddingElement.dart';

class PointContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return paddingElement(Row(
      children: [
        Expanded(child: Section1()),
        Expanded(child: Section2()),
      ],
    ));
  }

  Column Section1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, //세로로 중앙 정렬되도록 함
      children: [
        Text("현재 티켓 현황",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
        SizedBox(height: 16), // 세 위젯 사이의 간격을 위한 SizedBox
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            coloredText("5", 30),
            SizedBox(width: 5),
            Text("장",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 16), // 세 위젯 사이의 간격을 위한 SizedBox
        ButtonForPointContainer(
            130, 'assets/images/GoogleIcon.png', '티켓 구매', null),
      ],
    );
  }

  Column Section2() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center, //세로로 중앙 정렬되도록 함
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("적립된 포인트",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  coloredText("7000", 20),
                  Text("P",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          ButtonForPointContainer(
              200, 'assets/images/BuyTicketAsPoint.png', '포인트로 티켓 구매', () {}),
          SizedBox(height: 16),
          ButtonForPointContainer(
              200, 'assets/images/chargingByWatching.png', '영상 보고 충전하기', () {}),
          SizedBox(height: 16),
          ButtonForPointContainer(
              200, 'assets/images/BuyRandomBox.png', '랜덤박스 구매하기', () {}),
        ]);
  }

  Text coloredText(String text, double size) {
    return Text(text,
        style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(66, 124, 239, 1)));
  }

  NeumorphicButton ButtonForPointContainer(width, imageUrl, text, onPressed) {
    return NeumorphicButton(
      lockAvailable: true,
      width: width,
      radius: 30,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(imageUrl),
          Text(text,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
