// import 'dart:io';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:test3/models/user_model.dart';
//
// class Services {
//   static Future<Map<String, dynamic>> login(String username, String password) async {
//     Uri url = Uri.parse('https://192.168.0.64:4433/api/Authentication/login');
//     Map<String, String> data = {
//       'Username': username,
//       'Password': password,
//     };
//
//     try {
//       // Send POST request
//       var response = await http.post(
//         url,
//         body: json.encode(data),
//         headers: <String, String>{'Content-Type': 'application/json'},
//       );
//
//       // Check the status code
//       if (response.statusCode == 200) {
//         // Decode the response
//         Map<String, dynamic> responseData = json.decode(response.body);
//
//         // Check if the response contains user data
//         if (responseData.containsKey('data')) {
//           User user = User.fromJson(responseData['data']); // Assuming user data is under 'data' key
//           return {
//             'status': true,
//             'message': 'Successfully logged in.',
//             'data': user,
//           };
//         } else {
//           return {
//             'status': false,
//             'message': 'User data not found in response.',
//           };
//         }
//       } else {
//         // Safely handling error based on the response body
//         String errorMessage = 'Login failed';
//         if (response.body.isNotEmpty) {
//           try {
//             errorMessage = json.decode(response.body)['message'] ?? errorMessage;
//           } catch (e) {
//             // Handle JSON parsing error
//           }
//         }
//         return {
//           'status': false,
//           'message': errorMessage,
//         };
//       }
//     } on SocketException {
//       return {
//         'status': false,
//         'message': 'Unsuccessful request: Network error.',
//       };
//     } catch (e) {
//       // Catch any other errors
//       return {
//         'status': false,
//         'message': 'An unexpected error occurred: $e',
//       };
//     }
//   }
// }
