import 'package:flutter/material.dart';
import 'LogoAppBar.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: LogoAppBar(),
          body: Container(),
        )
    );
  }
}


