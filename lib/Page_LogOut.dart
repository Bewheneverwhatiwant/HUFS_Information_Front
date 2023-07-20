import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';

class LogOut extends StatelessWidget {
  final BuildContext context;
  const LogOut({required this.context, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
    );
  }
}