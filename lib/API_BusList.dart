import 'package:http/http.dart' as http;
import 'dart:convert';
import 'API_BusInfo.dart';

class BusList {
  List<int> busNumbers = [1303, 1117, 1150, 1005];
  List<String> busStops = ['파란지붕', '도서관', '기숙사', '모현지석묘', '외대입구'];

  Future<Map<String, Map<String, List<int>>>> fetchBusLocations() async {
    final downData = await ApiCaller.fetchBusData('228000345');
    final upData = await ApiCaller.fetchBusData('228000349');

    Map<String, List<int>> downList = getBusListData(downData);
    Map<String, List<int>> upList = getBusListData(upData);

    Map<String, Map<String, List<int>>> locations = {
      'downList': downList,
      'upList': upList,
    };

    return locations;
  }

  Map<String, List<int>> getBusListData(Map<String, BusInfo> busLocations) {
    Map<String, List<int>> busListData = {};

    for (String stop in busStops) {
      busListData[stop] = [];
    }

    for (String location in busLocations.keys) {
      int locationIndex = int.parse(busLocations[location]!.location);
      if (locationIndex < busStops.length) {
        busListData[busStops[locationIndex]]!.add(int.parse(location));
      }
    }

    return busListData;
  }
}

//현재 upList와 downList 출력이 이루어지지 않는 상황. 수정 필요
void PrintBusList() async {
  BusList busList = BusList();
  Map<String, Map<String, List<int>>> locations =
      await busList.fetchBusLocations();
  Map<String, List<int>> downList = locations['downList']!;
  Map<String, List<int>> upList = locations['upList']!;

  print('하행버스-정류장 리스트화');
  downList.forEach((stop, buses) {
    print('$stop: $buses');
  });

  print('상행버스-정류장 리스트화');
  upList.forEach((stop, buses) {
    print('$stop: $buses');
  });
}
