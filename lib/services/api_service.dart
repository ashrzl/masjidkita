import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = "http://192.168.0.64:4433/api/Authentication/login"; // replace with your API

  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "userame": username,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response
      return jsonDecode(response.body);
    } else {
      // If the server returns an error
      throw Exception("Failed to login");
    }
  }
}
