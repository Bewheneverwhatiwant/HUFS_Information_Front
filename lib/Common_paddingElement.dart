import 'package:flutter/material.dart';

// 클래스가 아닌 메소드 파일. 이 안에 요소를 넣으면 top 패딩을 줌.
Padding paddingTop(child) {
  return Padding(
    padding: EdgeInsets.only(top: 20),
    child: child,
  );
}

Padding paddingElement(child) {
  return Padding(
    padding: EdgeInsets.fromLTRB(20, 20, 20, 00),
    child: child,
  );
}
