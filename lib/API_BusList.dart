import 'package:http/http.dart' as http;
import 'dart:convert';
import 'API_BusInfo.dart';

class BusList {
  List<int> busNumbers = [1303, 1117, 1150, 1005];
  List<String> busStops = ['파란지붕', '도서관', '기숙사', '모현지석묘', '외대입구'];

  Future<Map<String, List<int>>> fetchBusLocations() async {
    final downData = await ApiCaller.fetchBusData('228000345');
    final upData = await ApiCaller.fetchBusData('228000349');

    List<int> downList = getListData(downData);
    List<int> upList = getListData(upData);

    Map<String, List<int>> locations = {
      'downList': downList,
      'upList': upList,
    };

    return locations;
  }

  List<int> getListData(Map<String, BusInfo> busLocations) {
    List<int> listData = [];

    for (int i = 0; i < 5; i++) {
      for (int bus in busNumbers) {
        if (busLocations.containsKey(bus.toString()) &&
            busLocations[bus.toString()]!.location == (4 - i).toString()) {
          listData.add(bus);
        }
      }
    }

    return listData;
  }
}

//현재 upList와 downList 출력이 이루어지지 않는 상황. 수정 필요
void main() async {
  BusList busList = BusList();
  Map<String, List<int>> locations = await busList.fetchBusLocations();
  List<int> downList = locations['downList'] ?? [];
  List<int> upList = locations['upList'] ?? [];

  print('하행버스-정류장 리스트화');
  print(downList ?? []);

  print('상행버스-정류장 리스트화');
  print(upList ?? []);
}
