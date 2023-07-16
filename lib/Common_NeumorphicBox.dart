import 'package:flutter/material.dart';

class NeumorphicBox extends StatelessWidget {
  const NeumorphicBox({
    required this.child,
    this.alignment = Alignment.center,
    this.height,
    this.width,
  });

  final Widget child;
  final Alignment alignment;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              offset: Offset(4, 4), blurRadius: 12, color: Color(0xFFBECBD9))
        ]),
      child: Align(
        alignment: alignment,
        child: child,
      ),
    );
  }
}
