import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';

class InfoBus extends StatelessWidget {
  final BuildContext context;
  const InfoBus({required this.context, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
    );
  }
}
