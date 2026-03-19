import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://reqres.in/api';
  final String apiKey = 'reqres_32e47dacd4744f009b24358d68f0272d';

  Future<Map<String, dynamic>> getUsers(int page, int perPage) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users?page=$page&per_page=$perPage'),
      headers: {'x-api-key': apiKey},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }
}
