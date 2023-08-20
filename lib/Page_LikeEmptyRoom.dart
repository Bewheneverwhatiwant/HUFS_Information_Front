import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';
import 'Page_InfoLecture.dart';

class LikeEmptyRoom extends StatelessWidget {
  final BuildContext context;
  const LikeEmptyRoom({required this.context, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
    );
  }
}