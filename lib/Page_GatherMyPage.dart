import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';
import 'MainPage_MenuList.dart';
import 'Page_LogOut.dart';
import 'Common_NeumorphicButton.dart';
import 'Page_DeleteAccount.dart';
import 'Common_NeumorphicBox.dart';
import 'Common_paddingElement.dart';
import 'Gather_PointContainer.dart';
import 'Page_BuyTicketByPoint.dart';
import 'Page_EarnPointByWatch.dart';
import 'Page_BuyRandomBox.dart';
import 'Page_BuyTicketAsMoney.dart';

class GatherMyPage extends StatelessWidget {
  final BuildContext context;
  const GatherMyPage({required this.context, Key? key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: LogoAppBar(),
      body: ListView(
        children: [
          NeumorphicBox(child: Text('MY PAGE', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800))),
          NeumorphicBox(
            child: Row(
            children: [
          Expanded(child: myInfo1()),
          Expanded(child: myInfo2()),
            ],
          ),
          ),
          SizedBox(height: 30,),
          
          AccountColumn(),
          
          
        ],
      ),
    );
  }

  Column myInfo1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('닉네임', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        SizedBox(height: 20,),
        Text('전화번호', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        SizedBox(height:20),
        Text('현재 보유 티켓', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        SizedBox(height: 20,),
        Text('현재 보유 티켓(이벤트)', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        SizedBox(height: 20),
        Text('현재 보유 포인트', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
    ],);
  }

  Column myInfo2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //예시~
        Text('나영잉', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
        SizedBox(height: 20,),
        Text('010-4595-7817', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
        SizedBox(height: 20),
        Text('5장', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color:Colors.blue)),
        SizedBox(height: 20,),
        Text('3장', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.blue)),
        SizedBox(height: 20),
        Text('7000P', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color:Colors.blue)),
    ],);
  }

 
  


//로그아웃, 회원탈퇴 버튼 column
Padding AccountColumn() {
  return paddingElement(
    Column(
    children: [
      Row(
            children: [
              Container(
                width: 200,
          child: NeumorphicButton(
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => LogOut(context: context)));},
            child: Text('로그아웃'),),),
            SizedBox(width: 40),
            Container(
              width: 200,
          child: NeumorphicButton(
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => DeleteAccount(context: context)));},
            child: Text('회원탈퇴'),),),
            ],
    ),
    SizedBox(height: 20),
    Row(
            children: [
              Container(
                width: 200,
          child: NeumorphicButton(
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => BuyTicketByPoint(context: context)));},
            child: Text('포인트로 티켓 구매'),),),
            SizedBox(width: 40),
            Container(
              width: 200,
          child: NeumorphicButton(
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => EarnPointByWatch(context: context)));},
            child: Text('영상 보고 포인트 충전'),),),
            ],
    ),
    SizedBox(height: 20),
    Row(
            children: [
              Container(
                width: 200,
          child: NeumorphicButton(
            lockAvailable: true,
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => BuyTicketAsMoney(context: context)));},
            child: Text('유료로 티켓 구매'),),),
            SizedBox(width: 40),
            Container(
              width: 200,
          child: NeumorphicButton(
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => BuyRandomBox(context: context)));},
            child: Text('랜덤박스 구매'),),),
            ],
    ),
    ],
    ),
          );
}

}
