import 'package:flutter/material.dart';

Future<dynamic> NextPage(context, Widget route) {
  return Navigator.push(
    context,
    // TODO : 넘어가야 할 페이지 다시 정의해야함
    MaterialPageRoute(builder: (context) => route),
  );
}
