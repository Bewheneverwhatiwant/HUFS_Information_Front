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

//upList와 downList를 이차원 배열로 만듦
//BusInfo의 locations 속성으로 위치를 설정하고, busStops list의 인덱스로 딕셔너리에 버스 번호를 추가
//즉, busListData의 key는 정류장, value는 도착한 버스 번호 리스트가 됨
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
// (service key가 null -> InfoBus.dart의 Future 객체에서 null을 이용불가 -> 버스 페이지 로딩 오류)
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
