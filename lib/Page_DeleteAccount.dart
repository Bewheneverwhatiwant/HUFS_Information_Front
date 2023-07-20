import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';

class DeleteAccount extends StatelessWidget {
  final BuildContext context;
  const DeleteAccount({required this.context, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
    );
  }
}