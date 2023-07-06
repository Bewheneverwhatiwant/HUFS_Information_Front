import 'package:flutter/material.dart';
import 'Common_NeumorphicButton.dart';

class SmallButton extends StatelessWidget {
  const SmallButton(
      {required this.onPressed, required this.title, required this.imageName});

  final VoidCallback? onPressed;
  final String title;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: onPressed,
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Image.asset(
            imageName,
            width: 100.0,
            height: 100.0,
          )
        ],
      ),
    );
  }
}
