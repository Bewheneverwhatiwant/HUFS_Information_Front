import 'package:flutter/material.dart';
import 'Common_NeumorphicBox.dart';

class ChattingRoomList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return NeumorphicBox(
      child: Column(

        children: [

          //첫번째 Row
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("엽기떡볶이 드실 분 구합니다", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Row(
                children: [
              Image.asset('assets/images/Icon-siren.png'),
              Text("신고하기", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
                ]
              )
            ],
          ),

          SizedBox(height:16),


          //두번째 Row
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("수령장소: 기숙사 A동"),
                    Text("기본 배달비: 5000원"),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height:16),

          //세번째 Row

          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("현재 3명 참가 중"),
              //SizedBox(width:28),
              Text("18:25까지 모집"),
            ],
          ),
        ],
      ),
    );
  }
}
