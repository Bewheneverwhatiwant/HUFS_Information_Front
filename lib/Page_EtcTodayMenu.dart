import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';

class EtcTodayMenu extends StatelessWidget {
  final BuildContext context;
  const EtcTodayMenu({required this.context, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
    );
  }
}
