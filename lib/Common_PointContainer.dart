import 'package:flutter/material.dart';
import 'Common_ButtonForPointContainer.dart';

class PointContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, //세로로 중앙 정렬되도록 함
              children: [
                Text("현재 티켓 현황", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(height: 16), // 세 위젯 사이의 간격을 위한 SizedBox
                Text("5장", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 16), // 세 위젯 사이의 간격을 위한 SizedBox
                ButtonForPointContainer(
                onPressed: null, 
                child: Row(
                  children: [
                  Image.asset('assets/images/GoogleIcon.png'), 
                  SizedBox(width:15),
                  Text('티켓 구매', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  ],
                  ),
                ),
              ],
            
            ),
      ),
          ),

      Expanded(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //세로로 중앙 정렬되도록 함
            children: [
              Text("적립된 포인트: 7000P", style: TextStyle(fontSize:15, fontWeight: FontWeight.bold)),
              SizedBox(height: 16), // 세 위젯 사이의 간격을 위한 SizedBox
              ButtonForPointContainer(
                onPressed: null,
                child: Row(
                  children: [
                    Image.asset('assets/images/BuyTicketAsPoint.png'),
                    SizedBox(width:15),
                    Text('포인트로 티켓 구매', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  ]
                )
              ),
              SizedBox(height: 16), // 세 위젯 사이의 간격을 위한 SizedBox
              ButtonForPointContainer(
                onPressed: null,
                child: Row(
                  children: [
                    Image.asset('assets/images/chargingByWatching.png'),
                    SizedBox(width:15),
                    Text('영상 보고 충전하기', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  ]
                )
              ),
              SizedBox(height: 16), // 세 위젯 사이의 간격을 위한 SizedBox
              ButtonForPointContainer(
                onPressed: null,
                child: Row(
                  children: [
                    Image.asset('assets/images/BuyRandomBox.png'),
                    SizedBox(width:15),
                    Text('랜덤박스 구매하기', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  ]
                )
              ),
            ]
          )
        )
      )
      ],
        );
  }}
  
  