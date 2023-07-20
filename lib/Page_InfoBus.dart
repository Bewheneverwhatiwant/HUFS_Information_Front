import 'package:flutter/material.dart';
import 'Common_LogoAppBar.dart';
import 'Common_NeumorphicBox.dart';
import 'Common_paddingElement.dart';

class InfoBus extends StatelessWidget {
  final BuildContext context;
  const InfoBus({required this.context, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
      body: 
      paddingElement(
      ListView(
         
        children: [
          UpOrDown(), //상행/하행 표지판(?)
          SizedBox(height: 50),
          TopCurved(), //상단 곡선으로 이어진 부분
          buildCustomColumn(), //중간 동그라미 + 막대 반복되는 부분
          BottomCurved(), //하단 곡선으로 이어진 부분
          SizedBox(height: 30,),
        ]
      ),
      ),
      );
  }

//하단 곡선 부분
  Container BottomCurved() {
    
    return Container(
      
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
          
              CustomPaint(
                 painter: CurvePainter(startX: 0, startY: 0, controlPoint1X: 0, controlPoint1Y: 50, endPointX: 50, endPointY: 50),
                  child: Container(
                  width: 50.0,
                  height: 50.0,
                      ),
                     ),
                     
                     Transform.translate(
                  offset: Offset(0, 25), //Y축 방향으로 이동함!!
                  child: 
                  CustomPaint(
                      painter: HorizontalLinePainter(),
                      size: Size(50, 10),
                        )
                  ),
            
              CustomPaint(
                 painter: CurvePainter(startX: 0, startY: 50, controlPoint1X: 50, controlPoint1Y: 50, endPointX: 50, endPointY: 0), //좌 하단
                  child: Container(
                  width: 50.0, // 임의의 컨테이너 크기
                  height: 50.0, // 임의의 컨테이너 크기
                      ),
                     ),
                     
              
          ],
      ),
            );
  }

//상단 곡선 부분
  Container TopCurved() {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              
              //1번
              CustomPaint(
                 painter: CurvePainter(startX: 0, startY: 50, controlPoint1X: 0, controlPoint1Y: 0, endPointX: 50, endPointY: 0), //좌 하단
                  child: Container(
                  width: 50.0,
                  height: 50.0,
                      ),
                     ),
                
                 Transform.translate(
                  offset: Offset(0, -25), //Y축 방향으로 이동함!!
                  child: 
                  CustomPaint(
                      painter: HorizontalLinePainter(),
                      size: Size(50, 10),
                        )
                  ),
                
                     //2번
              CustomPaint(
                 painter: CurvePainter(startX: 0, startY: 0, controlPoint1X: 50, controlPoint1Y: 0, endPointX: 50, endPointY: 50), //좌 하단
                  child: Container(
                  width: 50.0,
                  height: 50.0,
                      ),
                     ),
          ],
      ),
    );
  }
}

//곡선 자체를 만드는 코드
class CurvePainter extends CustomPainter {
  final double startX;
  final double startY;
  final double controlPoint1X;
  final double controlPoint1Y;
  final double endPointX;
  final double endPointY;

  CurvePainter({
    required this.startX,
    required this.startY,
    required this.controlPoint1X,
    required this.controlPoint1Y,
    required this.endPointX,
    required this.endPointY,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;

    Path path = Path();
    path.moveTo(startX, startY); //시작하는 좌표

    path.quadraticBezierTo(
      controlPoint1X,
      controlPoint1Y,
      endPointX,
      endPointY,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


//원 그리기용
Widget buildCircleContainer(double widthSize, double heightSize, Color color) {
  return Container(
    width: widthSize,
    height: heightSize,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: color,
        width: 10,
      ),
    ),
  );
}

//세로 막대 그리기 용
class VerticalLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10.0;

    Offset startPoint = Offset(size.width / 2, 0);
    Offset endPoint = Offset(size.width / 2, size.height);

    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

//가로 막대 그리기 용

class HorizontalLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10.0;

    Offset startPoint = Offset(0, size.height / 2);
    Offset endPoint = Offset(size.width, size.height / 2);

    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}




//동그라미랑 막대 합쳐서 반복 돌리기


Widget buildCustomColumn() {
  List<String> textList = ['파란지붕', '도서관', '기숙사', '모현지석묘', '외대입구', '외대사거리'];
  List<List<String>> UpBus = [
    ['1303'],
    ['1150', '1005', '1117', '1303'],
    ['1303'],
    [], // 모현지석묘에는 도착하는 버스가 없는 상황!!
    ['1005', '1117'],
    ['1150']
  ];
  List<List<String>> DownBus = [
    ['1303'],
    ['1150', '1005', '1303', '1117'],
    ['1303'],
    ['1117'],
    ['1005', '1117'],
    []
  ];

  List<Widget> columns = [];

  for (int i = 0; i < 6; i++) {
    List<Widget> upWidgets = [];
    List<Widget> downWidgets = [];

    if (UpBus[i].isNotEmpty) {
      for (int j = 0; j < UpBus[i].length; j++) {
        upWidgets.add(
          CircleWithText(UpBus[i][j]),
        );
        upWidgets.add(
          SizedBox(height: 10),
        );
      }
    }

    if (DownBus[i].isNotEmpty) {
      for (int j = 0; j < DownBus[i].length; j++) {
        downWidgets.add(
          CircleWithText(DownBus[i][j]),
        );
        downWidgets.add(
          SizedBox(height: 10),
        );
      }
    }

    columns.add(
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              //constrainedBox로 버스 번호가 뜨는 컨테이너 크기 강제
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 80, height: 10),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: upWidgets, //상행버스 리스트 출력되는 부분!
                ),
              ),

              //Column{Row(동글 + 정류장 + 동글)} * length.textList가 되는것임!!

              Container(
                child: Row(
                  children: [
                    buildCircleContainer(50, 50, Colors.blue),
                    Container(
                      width: 100,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          textList[i],
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    buildCircleContainer(50, 50, Colors.blue),
                  ],
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 80, height: 10),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: downWidgets,
                ),
              ),
            ],
          ),
          // 막대
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPaint(
                painter: VerticalLinePainter(),
                child: Container(
                  width: 50.0,
                  height: 80.0,
                ),
              ),
              SizedBox(width: 100),
              CustomPaint(
                painter: VerticalLinePainter(),
                child: Container(
                  width: 50.0,
                  height: 80.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  return Column(
    children: columns,
  );
}



//화면 맨 위의 상행/하행 표지판(?)

Container UpOrDown() {
  return Container( 
    padding: EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      NeumorphicBox(
        child: Text('상행버스', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
      ),
      
      Text('무료구간 광역버스의\n실시간 도착 정보입니다.', textAlign: TextAlign.center),
      NeumorphicBox(
        child: Text('하행버스', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        )
    ],)
  );
}

//버스 번호가 뜰 박스(?)
class CircleWithText extends StatelessWidget {
  final String text;

  CircleWithText(this.text);

  @override
  Widget build(BuildContext context) {
    return NeumorphicBox(
    
    child: 
        Container(
          width: 23,
          height: 10,
          
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        );
      
  }
}



