import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';

class BuyTicketByPoint extends StatelessWidget {
  final BuildContext context;
  const BuyTicketByPoint({required this.context, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
    );
  }
}