import 'dart:convert';
import 'package:http/http.dart' as http;

class Api_SignUpAvailable {
  final String baseUrl;

  Api_SignUpAvailable(this.baseUrl);

  //닉네임 중복 확인을 위한 api 호출
  Future<bool> checkNicknameAvailability(String nickname) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/check?nickname=$nickname'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return !data['nicknameExist'];
      } else {
        print('서버 응답 오류: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('서버 통신 실패: $e');
      return false;
    }
  }
}
