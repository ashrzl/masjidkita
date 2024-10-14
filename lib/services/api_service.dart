import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl =
      "http://10.0.2.2:7220/api/Authentication/Login";

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "Username": username,
          "Password": password,
        }),
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response
        return jsonDecode(response.body);
      } else {
        // Error status handling
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}");
        throw Exception("Failed to login. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error occurred: $e");
    }
  }
}
