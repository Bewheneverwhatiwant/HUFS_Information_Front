import 'package:flutter/material.dart';

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    bool isAfterFive = now.hour >= 17;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: customNeumorphicBox(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 첫 단과 두 번째 단
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // 첫 단
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("알뜰모집"),
                              customNeumorphicButton(child: Text("택시 같이타!")),
                              customNeumorphicButton(child: Text("배달 같이해!")),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        // 두 번째 단
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("상시 이용 가능"),
                              Expanded(
                                child: customNeumorphicButton(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("도와줘요!"),
                                      Icon(Icons.help_outline),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // ProgressBar
                  Column(
                    children: [
                      LinearProgressIndicator(
                        value: isAfterFive ? 1.0 : now.hour / 17,
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(isAfterFive ? "이제 사람들을 모아 돈을 절약해보세요!" : "아직 모집할 수 없어요!"),
                      ),
                      if (!isAfterFive)
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text('모집 가능 시간 까지 ${17 - now.hour}:${60 - now.minute}'),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customNeumorphicBox({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey[300],
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            offset: Offset(-5.0, -5.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Colors.grey[500]!,
            offset: Offset(5.0, 5.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: child,
    );
  }

  Widget customNeumorphicButton({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: customNeumorphicBox(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 60,
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
