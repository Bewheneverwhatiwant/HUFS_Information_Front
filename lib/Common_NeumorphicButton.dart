import 'package:flutter/material.dart';

class NeumorphicButton extends StatelessWidget {
  const NeumorphicButton({
    required this.onPressed,
    required this.child,
    this.alignment = Alignment.center,
    this.lockAvailable = false,
    this.radius = 8.0,
    this.height,
    this.width,
    
  });

  final VoidCallback? onPressed;
  final Widget child;
  final Alignment alignment;
  final bool lockAvailable;
  final double radius;
  final double? height;
  final double? width;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            height: height,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                color: onPressed != null ? Colors.white : Colors.grey,
                
                boxShadow: const [
                  // BoxShadow(
                  //     offset: Offset(-4, -4), blurRadius: 3, color: Colors.white),
                  BoxShadow(
                      offset: Offset(4, 4),
                      blurRadius: 12,
                      color: Color(0xFFBECBD9))
                ]),
                
            child: Stack(
              alignment: alignment,
              children: [
                child,
                if (lockAvailable == true &&
                    onPressed == null) // 버튼 비활성화 시, 잠금 아이콘 생성
                  const Icon(
                    Icons.lock,
                    color: Colors.white,
                  )
              ],
            )
            
            ));
  }
}
