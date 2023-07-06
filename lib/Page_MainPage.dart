import 'package:flutter/material.dart';
import 'package:hufs_information/Common_NeumorphicButton.dart';
import 'Common_LogoAppBar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: LogoAppBar(),
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                NeumorphicButton(onPressed: null, child: Text('Hello World!')),
              ],
            )));
  }
}
