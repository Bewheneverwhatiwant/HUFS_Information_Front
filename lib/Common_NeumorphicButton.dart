import 'package:flutter/material.dart';

class NeumorphicButton extends StatelessWidget {
  const NeumorphicButton({
    required this.onPressed,
    required this.child,
    this.alignment = Alignment.center, // default value is Alignment.center
  });

  final VoidCallback? onPressed;
  final Widget child;
  final Alignment alignment; // new parameter

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Align(
            alignment: alignment,
            child: child,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: onPressed != null ? Colors.white : Colors.grey,
              boxShadow: [
                // BoxShadow(
                //     offset: Offset(-4, -4), blurRadius: 3, color: Colors.white),
                BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 12,
                    color: Color(0xFFBECBD9))
              ]),
        ));
  }
}
