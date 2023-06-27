import 'package:flutter/material.dart';
import 'NeumorphicButton.dart';

class MainMenu extends StatelessWidget {
  const MainMenu(this.title, this.buttons);

  final String title;
  final List<String> buttons;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Row(
          children: buttons.map((btn) {
            return Expanded(
              child: NeumorphicButton(
                onPressed: () {
                  print('$btn button pressed');
                },
                child: Text(btn),
              )
            );
          }).toList(),
        )
      ],
    );
  }
}
