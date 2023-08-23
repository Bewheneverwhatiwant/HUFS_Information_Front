import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';

class UserSOS extends StatelessWidget {
  final BuildContext context;
  const UserSOS({required this.context, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
    );
  }
}
