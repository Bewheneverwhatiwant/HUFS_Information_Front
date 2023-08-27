import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';
import 'Common_NeumorphicButton.dart';
import 'Common_paddingElement.dart';
import 'Common_NeumorphicBox.dart';
import 'Page_MyRandomBox.dart';
import 'Page_RandomBoxInfo.dart';

class BuyRandomBox extends StatelessWidget {
  final BuildContext context;
  const BuyRandomBox({required this.context, Key? key});
  final int Point = 7000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: LogoAppBar(),
        body: ListView(
          children: [
            PointContainer(context), //상단의 포인트, 티켓, 랜덤박스 총정리 부분
            paddingElement(
              createCustomButton(
                context: context,
                image: AssetImage('assets/images/RandomBox.jpg'),
                title: 'HUFS Infogral',
                subTitle: '랜덤박스S',
                price: 1000,
                Point: Point,
              ),
            ),
            paddingElement(
              createCustomButton(
                context: context,
                image: AssetImage('assets/images/RandomBox2.jpg'),
                title: 'HUFS Infogral',
                subTitle: '랜덤박스A',
                price: 800,
                Point: Point,
              ),
            ),
            paddingElement(
              createCustomButton(
                context: context,
                image: AssetImage('assets/images/RandomBox3.jpg'),
                title: 'HUFS Infogral',
                subTitle: '랜덤박스B',
                price: 600,
                Point: Point,
              ),
            ),
            paddingElement(
              createCustomButton(
                context: context,
                image: AssetImage('assets/images/RandomBox2.jpg'),
                title: 'HUFS Infogral',
                subTitle: '랜덤박스C',
                price: 400,
                Point: Point,
              ),
            ),
            paddingElement(
              createCustomButton(
                context: context,
                image: AssetImage('assets/images/RandomBox2.jpg'),
                title: 'HUFS Infogral',
                subTitle: '랜덤박스C',
                price: 400,
                Point: Point,
              ),
            ),
            paddingElement(
              createCustomButton(
                context: context,
                image: AssetImage('assets/images/RandomBox2.jpg'),
                title: 'HUFS Infogral',
                subTitle: '랜덤박스C',
                price: 400,
                Point: Point,
              ),
            ),
            paddingElement(
              createCustomButton(
                context: context,
                image: AssetImage('assets/images/RandomBox2.jpg'),
                title: 'HUFS Infogral',
                subTitle: '랜덤박스C',
                price: 400,
                Point: Point,
              ),
            ),
            paddingElement(
              createCustomButton(
                context: context,
                image: AssetImage('assets/images/RandomBox2.jpg'),
                title: 'HUFS Infogral',
                subTitle: '랜덤박스C',
                price: 400,
                Point: Point,
              ),
            ),
            paddingElement(
              createCustomButton(
                context: context,
                image: AssetImage('assets/images/RandomBox2.jpg'),
                title: 'HUFS Infogral',
                subTitle: '랜덤박스C',
                price: 400,
                Point: Point,
              ),
            ),
            paddingElement(
              createCustomButton(
                context: context,
                image: AssetImage('assets/images/RandomBox2.jpg'),
                title: 'HUFS Infogral',
                subTitle: '랜덤박스C',
                price: 400,
                Point: Point,
              ),
            ),
          ],
        ));
  }

  NeumorphicBox PointContainer(BuildContext context) {
    return NeumorphicBox(
        child: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text('현재 보유 포인트:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              SizedBox(height: 15),
              Text('현재 보유 티켓:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              SizedBox(height: 15),
              Text('현재 보유 랜덤박스:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))
            ],
          ),
          SizedBox(width: 50),
          Column(
            children: [
              Row(children: [
                Text('$Point',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.blue)),
                Text('P',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))
              ]),
              SizedBox(height: 15),
              Row(
                children: [
                  Text('3',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.blue)),
                  Text('장',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24))
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Text('0',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.blue)),
                  Text('개',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24))
                ],
              ),
            ],
          )
        ],
      ),
      SizedBox(height: 10),
      NeumorphicButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MyRandomBox(
                // context: context,
                // image: image,
                // title: title,
                // subTitle: subTitle,
                // price: price,
                // Point: Point,
                ),
          ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('나의 랜덤박스 보관함',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
          ],
        ),
      ),
    ]));
  }
}

Widget createCustomButton({
  required context,
  required ImageProvider<Object> image,
  required String title,
  required String subTitle,
  required int price,
  required int Point,
}) {
  return NeumorphicButton(
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => RandomBoxInfo(
          context: context,
          image: image,
          title: title,
          subTitle: subTitle,
          price: price,
          Point: Point,
        ),
      ));
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image(image: image, width: 150, height: 150),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 10),
                Text(
                  subTitle,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            Text(
              '$price',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            Text(
              'P',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ],
    ),
  );
}
