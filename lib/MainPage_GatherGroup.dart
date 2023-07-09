import 'package:flutter/material.dart';
import 'package:hufs_information/Page_GatherDelivery.dart';
import 'package:hufs_information/Page_GatherHelp.dart';
import 'package:hufs_information/Page_GatherTaxi.dart';
import 'Common_NeumorphicBox.dart';
import 'Common_NeumorphicButton.dart';

class GatherGroup extends StatelessWidget {
  const GatherGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    bool isAfterFive = now.hour >= 17;

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
                  child: GatherGroup1(context, isAfterFive), // [분리] 알뜰모집 영역
                ),
                const SizedBox(width: 16),
                Expanded(
                  // 두 번째 단
                  child: GatherGroup2(context, isAfterFive), // [분리] 상시모집 영역
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 진행 바
          Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                    isAfterFive ? "이제 사람들을 모아 돈을 절약해보세요!" : "아직 모집할 수 없어요!"),
              ),
              const SizedBox(height: 10),
              LinearProgressIndicator(
                value: isAfterFive ? 1.0 : now.hour / 17,
              ),
              if (!isAfterFive)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text('모집까지 ${17 - now.hour}시간 ${60 - now.minute}분 남음'),
                ),
            ],
          ),
        ],
      ),
    ));
  }

  Column GatherGroup1(context, isAfterFive) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("알뜰모집",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        const SizedBox(height: 10),
        NeumorphicButton(
            onPressed: isAfterFive
                ? () {
                    Navigator.push(
                      // 택시 페이지로 이동
                      context,
                      MaterialPageRoute(builder: (context) => GatherTaxi()),
                    );
                  }
                : null,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.local_taxi, color: Colors.green),
                SizedBox(width: 1),
                Flexible(
                  // Text위젯만 사용하면 OverFlow - Flexible 위젯 사용
                  child: Text(
                    "택시 같이타!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis, // 텍스트가 너무 길면 '...'으로 표시
                  ),
                ),
              ],
            )),
        const SizedBox(height: 10),
        NeumorphicButton(
            onPressed: isAfterFive
                ? () {
                    Navigator.push(
                      // 배달 페이지로 이동
                      context,
                      MaterialPageRoute(builder: (context) => GatherDelivery()),
                    );
                  }
                : null,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.delivery_dining,
                  color: Colors.green,
                ),
                SizedBox(width: 1),
                Flexible(
                  // Text위젯만 사용하면 OverFlow - Flexible 위젯 사용
                  child: Text(
                    "배달 같이해!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis, // 텍스트가 너무 길면 '...'으로 표시
                  ),
                ),
              ],
            )),
      ],
    );
  }

  Column GatherGroup2(context, isAfterFive) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("상시 이용 가능",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        const SizedBox(height: 5),
        Expanded(
          child: NeumorphicButton(
            onPressed: () {
              Navigator.push(
                // 도와줘요 페이지로 이동
                context,
                MaterialPageRoute(builder: (context) => GatherHelp()),
              );
            },
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
