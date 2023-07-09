import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'Common_NeumorphicBox.dart';
import 'MainPage_BannerSlider_slideList.dart';

class BannerSlider extends StatefulWidget {
  @override
  _BannerSliderState createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int _current = 0;
  late List<Widget> widgetList = slideList(context); // [파일분리] 슬라이드 불러옴;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 1.7,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: widgetList
              .map((item) => BoxCover(item))
              .toList(), // [분리] BoxCover : NeumorphicBox에 padding을 준 채로 item을 그 안에 넣음
        ),
        circleIndicator(), // [분리] 현재 위치를 나타내는 동그라미
      ],
    );
  }

  Row circleIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgetList.map((url) {
        int index = widgetList.indexOf(url);
        return Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _current == index
                ? Color.fromRGBO(0, 0, 0, 0.9)
                : Color.fromRGBO(0, 0, 0, 0.4),
          ),
        );
      }).toList(),
    );
  }

  Container BoxCover(child) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: NeumorphicBox(
        child: child,
      ),
    );
  }
}
