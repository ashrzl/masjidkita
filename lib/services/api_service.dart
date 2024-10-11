import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = "https://192.168.0.64:4433/api/Authentication/login";

  Future<Map<String, dynamic>> login(String Username, String Password) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "Username": Username,
        "Password": Password,
      }),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response
      return jsonDecode(response.body);
    }
    else if (response.statusCode != 200){
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      throw Exception("Failed to login");
    }
    else {
      throw Exception("Failed to login");
    }
  }
}
