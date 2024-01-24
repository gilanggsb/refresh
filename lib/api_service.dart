// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://108.136.252.63:8080/refresh/login.php';

  Future<Map<String, dynamic>> loginUser(
      String USERID, String USERPASSWORD) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/LOGIN'),
        body: {
          'ACTION': 'LOGIN',
          'USERID': USERID,
          'USERPASSWORD': USERPASSWORD,
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> result = jsonDecode(response.body);
        return result;
      } else {
        throw Exception('Failed to login');
      }
    } catch (error) {
      print('Error: $error');
      throw error;
    }
  }
}
