import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';

//아주 나중에, 유료 티켓 결제를 위한 화면

class BuyTicketAsMoney extends StatelessWidget {
  final BuildContext context;
  const BuyTicketAsMoney({required this.context, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
    );
  }
}