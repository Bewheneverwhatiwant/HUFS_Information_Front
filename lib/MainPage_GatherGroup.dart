import 'package:flutter/material.dart';
import 'Common_NeumorphicBox.dart';
import 'Common_NeumorphicButton.dart';

class GatherGroup extends StatelessWidget {
  const GatherGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    bool isAfterFive = now.hour >= 17;
    isAfterFive = true;

    return NeumorphicBox(
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
                Expanded(
                  // 첫 단
                  child: GatherGroup1(isAfterFive), // 알뜰모집 영역 - 하단에 분리해둠
                ),
                SizedBox(width: 16),
                Expanded(
                  // 두 번째 단
                  child: GatherGroup2(isAfterFive), // 상시모집 영역 - 하단에 분리해 둠
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // 진행 바
          Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                    isAfterFive ? "이제 사람들을 모아 돈을 절약해보세요!" : "아직 모집할 수 없어요!"),
              ),
              SizedBox(height: 10),
              LinearProgressIndicator(
                value: isAfterFive ? 1.0 : now.hour / 17,
              ),
              if (!isAfterFive)
                Align(
                  alignment: Alignment.bottomRight,
                  child:
                      Text('모집 가능 시간 까지 ${17 - now.hour}:${60 - now.minute}'),
                ),
            ],
          ),
        ],
      ),
    ));
  }

  Column GatherGroup1(isAfterFive) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("알뜰모집",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        NeumorphicButton(
            onPressed: isAfterFive
                ? () {
                    print('택시 같이타 눌림');
                  }
                : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.local_taxi, color: Colors.green),
                SizedBox(width: 10),
                Text("택시 같이타!", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            )),
        SizedBox(height: 10),
        NeumorphicButton(
            onPressed: isAfterFive
                ? () {
                    print('배달 같이해 눌림');
                  }
                : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.delivery_dining,
                  color: Colors.green,
                ),
                SizedBox(width: 10),
                Text("배달 같이해!", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            )),
      ],
    );
  }

  Column GatherGroup2(isAfterFive) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("상시 이용 가능",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        Expanded(
          child: NeumorphicButton(
            onPressed: isAfterFive
                ? () {
                    print('도와줘요 눌림');
                  }
                : null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("도와줘요!", style: TextStyle(fontWeight: FontWeight.bold)),
                Icon(Icons.directions_run, size: 40, color: Colors.red),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
