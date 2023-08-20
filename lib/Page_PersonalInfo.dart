import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';
import 'Common_paddingElement.dart';

class PersonalInfo extends StatelessWidget {
  final BuildContext context;
  const PersonalInfo({required this.context, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
      body: paddingElement(
        Column(children: [
          Text('개인정보 어쩌구 동의동의')
        ],)
      ),
    );
  }
}