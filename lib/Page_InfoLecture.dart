import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';

class InfoLecture extends StatelessWidget {
  final BuildContext context;
  const InfoLecture({required this.context, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
    );
  }
}
