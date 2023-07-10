import 'package:flutter/material.dart';

class ButtonForPointContainer extends StatelessWidget {
  const ButtonForPointContainer({
    required this.onPressed,
    required this.child,
    this.alignment = Alignment.center,
    this.height,
    this.width,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final Alignment alignment;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,

      //콘텐츠 크기에 맞게 버튼 감싸기
      child: IntrinsicWidth(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                offset: Offset(4, 4),
                blurRadius: 12,
                color: Color(0xFFBECBD9),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
