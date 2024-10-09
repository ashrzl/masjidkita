// import 'package:flutter/material.dart';
// import 'package:test3/models/user_model.dart'; // Assuming User model is defined here
// import 'package:test3/services/login_services.dart'; // Assuming Services.login() is defined here
// import 'package:test3/services/user_preferences.dart'; // Assuming UserPreferences is defined here
//
//
//
// class LoginController with ChangeNotifier {
//
//
//   User _user = User(
//     Username: '',
//     Password: '',
//     token: '',
//   );
//
//   User get user => _user;
//
//   String _message = '';
//   String get message => _message;
//
//
//
//   Future<Map<String, dynamic>> login(String username, String password) async {
//     Map<String, dynamic> result;
//
//
//     try {
//       var data = await Services.login(username, password); // Assuming login() returns a map
//       if (data['status']) {
//         _user = User.fromJson(data['data']); // Assuming User has a fromJson method
//         _message = data['message'];
//         result = {'status': data['status']};
//         await UserPreferences().saveUser(_user);
//
//       } else {
//         _message = '${data['message']} ${data['data']['message']}';
//         result = {'status': data['status']};
//
//       }
//     } catch (e) {
//       _message = 'An error occurred: $e';
//       result = {'status': false};
//
//     }
//
//     notifyListeners();
//     return result;
//   }
// }
