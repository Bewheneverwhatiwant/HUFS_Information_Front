import 'package:flutter/material.dart';

class CreateChat extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const CreateChat({
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        //원 크기 고정
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
          boxShadow: const [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 12,
              color: Color(0xFFBECBD9),
            ),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }
}
