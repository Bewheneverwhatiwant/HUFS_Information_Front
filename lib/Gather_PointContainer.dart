import 'package:flutter/material.dart';
import 'package:hufs_information/Common_NeumorphicButton.dart';
import 'package:hufs_information/Common_paddingElement.dart';
import 'Page_BuyRandomBox.dart';
import 'Page_BuyTicketByPoint.dart';
import 'Page_EarnPointByWatch.dart';
import 'Common_SnackBar.dart';
import 'Page_EarnPointByWatch.dart';

class PointContainer extends StatefulWidget {
  @override
  _PointContainerState createState() => _PointContainerState();
}

class _PointContainerState extends State<PointContainer> {
//구매하기 버튼 클릭 시 띄울 alert message
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: Text(
                '30초 광고를 시청하고 포인트를 충전합니다.',
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    showSnackbar(context, '광고 시청 후 티켓 구매가 취소되었습니다!');
                  },
                  child: Text('취소'),
                ),
                ElevatedButton(
                  onPressed: () {
                    showSnackbar(context, '광고 영상으로 이동합니다!');
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            EarnPointByWatch(context: context)));
                  },
                  child: Text('확인'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return paddingElement(Row(
      children: [
        Expanded(child: Section1()),
        Expanded(child: Section2(context)),
      ],
    ));
  }

  Column Section1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, //세로로 중앙 정렬되도록 함
      children: [
        const Text("현재 티켓 현황",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
        const SizedBox(height: 16), // 세 위젯 사이의 간격을 위한 SizedBox
        Column(
          children: [
            ticketCount("소장중인 티켓", 5, "장"),
            ticketCount("이벤트(기간제) 티켓", 3, "장"),
          ],
        ),
        const SizedBox(height: 16), // 세 위젯 사이의 간격을 위한 SizedBox
        ButtonForPointContainer(
            130, 'assets/images/GoogleIcon.png', '티켓 구매', null),
      ],
    );
  }

  Column Section2(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center, //세로로 중앙 정렬되도록 함
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("적립된 포인트",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  coloredText("7000", 20),
                  const Text("P",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          ButtonForPointContainer(
              200, 'assets/images/BuyTicketAsPoint.png', '포인트로 티켓 구매', () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BuyTicketByPoint(context: context)));
          }),
          const SizedBox(height: 16),
          ButtonForPointContainer(
              200, 'assets/images/chargingByWatching.png', '영상 보고 충전하기', () {
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => EarnPointByWatch(context: context)));
            _showConfirmationDialog();
          }),
          const SizedBox(height: 16),
          ButtonForPointContainer(
              200, 'assets/images/BuyRandomBox.png', '랜덤박스 구매하기', () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BuyRandomBox(context: context)));
          }),
        ]);
  }

  Row ticketCount(String name, int count, String unit) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(name,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      const SizedBox(width: 5),
      coloredText(count.toString(), 25),
      const SizedBox(width: 5),
      Text(unit,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    ]);
  }

  Text coloredText(String text, double size) {
    return Text(text,
        style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(66, 124, 239, 1)));
  }

  NeumorphicButton ButtonForPointContainer(
      double width, imageUrl, text, onPressed) {
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
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
