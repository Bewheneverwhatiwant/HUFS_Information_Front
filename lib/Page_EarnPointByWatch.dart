import 'package:flutter/material.dart';
import 'Common_LogoAppBar_NoBack.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:async';

class EarnPointByWatch extends StatefulWidget {
  final BuildContext context;
  const EarnPointByWatch({required this.context, Key? key});

  @override
  _EarnPointByWatchState createState() => _EarnPointByWatchState();
}

class _EarnPointByWatchState extends State<EarnPointByWatch> {
  int remainingSeconds = 30;
  bool countdownFinished = false;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        setState(() {
          countdownFinished = true;
        });
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar_NoBack(),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.all(16),
            width: 150,
            height: 150,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    value: countdownFinished ? 1 : 1 - (remainingSeconds / 30),
                  ),
                ),
                countdownFinished
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text('뒤로가기'),
                      )
                    : Text(
                        '$remainingSeconds',
                        style: TextStyle(fontSize: 40),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
