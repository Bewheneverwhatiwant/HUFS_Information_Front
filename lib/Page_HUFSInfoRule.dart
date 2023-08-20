import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';
import 'Common_paddingElement.dart';

class HUFSInfoRule extends StatelessWidget {
  final BuildContext context;
  const HUFSInfoRule({required this.context, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: LogoAppBar(),
        body: paddingElement(Column(
          children: [Text('이용약관 저쩌구 동의동의')],
        )));
  }
}
