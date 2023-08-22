import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dotenv_init.dart';
import 'package:xml/xml.dart' as xml;

// 광역버스 api가 xml 응답값이라, 그에 맞게 수정함. 이 파일은 기존 '버스언제와?' 서비스의 api caller과 같은 기능임!

class BusInfo {
  final String location;
  final String predictTime;

  BusInfo({required this.location, required this.predictTime});

  factory BusInfo.fromXml(xml.XmlElement xmlElement) {
    final location = xmlElement.getElement('locationNo1')?.text ?? 'N/A';
    final predictTime = xmlElement.getElement('predictTime1')?.text ?? 'N/A';

    return BusInfo(
      location: location,
      predictTime: predictTime,
    );
  }
}

class ApiCaller {
  static const bool testMode = false; //이 부분을 true로 바꾸어서 화면 출력 기능에 문제가 있는지 확인하기
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
    print('응답 상태 코드: ${response.statusCode}'); //광역버스 서버 응답 상태 코드 출력해라

    if (response.statusCode == 200) {
      print('성공!');
      Map<String, BusInfo> results = {};
      final xmlDoc = xml.XmlDocument.parse(response.body);
      final busArrivalList = xmlDoc.findAllElements('item');
      //final jsonData = json.decode(response.body);
      //final busArrivalList = jsonData['busArrivalList'];

      for (var busArrival in busArrivalList) {
        final routeId = busArrival.getElement('routeId')?.text;
        final locationNo1 = busArrival.getElement('locationNo1')?.text;
        final predictTime1 = busArrival.getElement('predictTime1')?.text;

        if (routeId != null && locationNo1 != null && predictTime1 != null) {
          results[routeId] = BusInfo(
            location: locationNo1,
            predictTime: predictTime1,
          );
        }
      }

      return results;
    } else {
      throw Exception('버스 api 호출 실패!!');
    }
  }
}
