// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiUrl {
  static String BASE_URL = 'http://108.136.252.63:8080/refresh';
  static String LOGIN_URL = '$BASE_URL/login.php/LOGIN';
  static String DATA_USER = '$BASE_URL/datasr.php/DATASR';
}

class ApiService {
  // final String baseUrl = '';

  Future<Map<String, dynamic>> loginUser(
      String USERID, String USERPASSWORD) async {
    try {
      final response = await http.post(
        Uri.parse(ApiUrl.LOGIN_URL),
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
      rethrow;
    }
  }
}

class Apiuser {
  // final String baseUrl = 'http://108.136.252.63:8080/refresh/';

  Future<Map<String, dynamic>> dataUser(
      String USERID, String USERPASSWORD) async {
    try {
      final response = await http.post(
        Uri.parse(ApiUrl.DATA_USER),
        body: {
          'ACTION': 'DATASR',
          'USERID': USERID,
          'USERPASSWORD': USERPASSWORD,
        },
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        Map<String, dynamic> result = json.decode(response.body);
        return result;
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.
        throw Exception('Failed to fetch data');
      }
    } catch (error) {
      // Handle other errors, e.g., network issues
      print('Error: $error');
      throw Exception('Failed to fetch data');
    }
  }
}
