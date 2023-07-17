import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';

class BuyRandomBox extends StatelessWidget {
  final BuildContext context;
  const BuyRandomBox({required this.context, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
    );
  }
}