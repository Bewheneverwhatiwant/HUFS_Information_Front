import 'dart:convert';
import 'package:http/http.dart' as http;

class Api_SignUp {
  final String phoneNumber;
  final String nickname;

  Api_SignUp({required this.phoneNumber, required this.nickname});

  factory Api_SignUp.fromJson(Map<String, dynamic> json) {
    return Api_SignUp(
      phoneNumber: json['phoneNumber'],
      nickname: json['nickname'],
    );
  }
}

final String baseUrl = 'http://server.infogral.kro.kr/api/members';

Future<Api_SignUp?> registerUser(String nickname, String phoneNumber) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/new'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nickname': nickname,
        'phoneNumber': phoneNumber,
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return Api_SignUp.fromJson(data); //회원가입 성공 시 회원 정보 반환
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      print('회원가입 실패: $errorMessage');
      return null; //회원가입 실패 시 null 반환
    }
  } catch (e) {
    print('회원가입 오류: $e');
    return null;
  }
}
