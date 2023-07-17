import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';

class GatherMyPage extends StatelessWidget {
  final BuildContext context;
  const GatherMyPage({required this.context, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
    );
  }
}
