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

class Apiuser {
  final String baseUrl = 'http://108.136.252.63:8080/refresh/datasr.php';

  Future<Map<String, dynamic>> dataUser(
      String USERID, String USERPASSWORD) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/DATASR'),
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
