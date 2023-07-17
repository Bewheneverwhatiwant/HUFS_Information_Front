import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';

class Share extends StatelessWidget {
  final BuildContext context;
  const Share({required this.context, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
    );
  }
}