import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';

class Setting extends StatelessWidget {
  final BuildContext context;
  const Setting({required this.context, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
    );
  }
}