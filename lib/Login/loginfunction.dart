import 'dart:convert'; // To convert data to JSON
import 'package:http/http.dart' as http;

Future<void> loginUser(String Username, String Password) async {
  // Your API URL
  final String apiUrl = 'https://cmsb-env2.com.my/api/Authentication/login';

  try {
    // Send POST request with email and password
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({
        'Username': Username,
        'Password': Password,
      }),
    );

    // Check if request was successful
    if (response.statusCode == 200) {
      // Parse the response body
      final Map<String, dynamic> data = json.decode(response.body);

      // Handle successful login, maybe save the token
      final token = data['token'];
      print('Login successful! Token: $token');

      // TODO: Store token securely (e.g., using Flutter Secure Storage)
    } else {
      print('Login failed with status: ${response.statusCode}');
      print('Error: ${response.body}');
    }
  } catch (error) {
    print('Error occurred during login: $error');
  }
}
