import 'dart:convert';
import 'package:http/http.dart' as http;

class AppService {
  static const String baseUrl = 'https://api.example.com';

  Future<Map<String, dynamic>> getData() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/data'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
