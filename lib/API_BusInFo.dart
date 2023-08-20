import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dotenv_init.dart';

class BusInfo {
  final String location;
  final String predictTime;

  BusInfo({required this.location, required this.predictTime});

  factory BusInfo.fromJson(Map<String, dynamic> json) {
    return BusInfo(
      location: json['location'] ?? 'N/A',
      predictTime: json['predictTime'] ?? 'N/A',
    );
  }
}

class ApiCaller {
  static const bool testMode = false;
  static String get serviceKey {
    final key = dotenv.env['SERVICE_KEY'];
    print('SERVICE_KEY: $key');
    return key ?? 'YOUR_DEFAULT_API_KEY';
  }

  static Future<Map<String, BusInfo>> fetchBusData(String stationId) async {
    if (testMode) {
      return {
        '1005': BusInfo(location: '0', predictTime: '999'),
        '1117': BusInfo(location: '3', predictTime: '999'),
        '1150': BusInfo(location: '3', predictTime: '999'),
        '1303': BusInfo(location: '4', predictTime: '999'),
      };
    }

    final base_url =
        'http://apis.data.go.kr/6410000/busarrivalservice/getBusArrivalList';
    final params = {'serviceKey': serviceKey, 'stationId': stationId};
    final uri = Uri.parse(base_url).replace(queryParameters: params);

    final response = await http.get(uri);
    print('응답 상태 코드: ${response.statusCode}'); // 응답 상태 코드 출력

    if (response.statusCode == 200) {
      print('성공!');
      Map<String, BusInfo> results = {};
      final jsonData = json.decode(response.body);
      final busArrivalList = jsonData['busArrivalList'];

      for (var busArrival in busArrivalList) {
        final routeId = busArrival['routeId'];
        final locationNo1 = busArrival['locationNo1'];
        final predictTime1 = busArrival['predictTime1'];

        results[routeId] = BusInfo(
            location: locationNo1.toString(),
            predictTime: predictTime1.toString());
      }

      return results;
    } else {
      throw Exception('버스 api 호출 실패!!');
    }
  }
}
