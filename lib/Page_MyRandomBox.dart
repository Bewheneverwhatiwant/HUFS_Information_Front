import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';

class MyRandomBox extends StatelessWidget {
  // final BuildContext context;
  // final ImageProvider<Object> image;
  // final String title;
  // final String subTitle;
  // final int price;
  // final int Point;

  // MyRandomBox({
  //   // required this.context,
  //   // required this.image,
  //   // required this.title,
  //   // required this.subTitle,
  //   // required this.price,
  //   // required this.Point,
  // });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
      body: Center(
        child: Column(
          children: [
            // Image(image: image),
            // Text(title),
            // Text(subTitle),
            // Text(price.toString()),
            // Text(Point.toString()),
          ],
        ),
      ),
    );
  }
}
