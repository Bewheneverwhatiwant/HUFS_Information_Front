import 'package:flutter/material.dart';

class AlertMessage extends StatelessWidget {

  //채팅방 입장 전 alert 화면 간단하개 틀만 잡아둠!!

  @override
  Widget build (BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
                title: Column(
              children: <Widget>[
                new Text("Dialog Title"),
              ],
            ),

             content: Column(

              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Dialog Content",
                ),
              ],
            ),
            
    );
  }
}