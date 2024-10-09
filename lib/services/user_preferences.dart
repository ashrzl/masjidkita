// import 'package:test3/models/user_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class UserPreferences {
//   Future saveUser(User user) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     prefs.setString('Username' , user.Username);
//     prefs.setString('Password' , user.Password);
//     prefs.setString('token' , user.token);
//   }
//
//   Future<User> getUser() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     try {
//       String Username = prefs.getString('Username') as String;
//       String Password = prefs.getString('Password') as String;
//       String token = prefs.getString('token') as String;
//
//       return User(Username: Username, Password: Password, token: token);
//     }
//     catch (e) {
//       throw e.toString();
//     }
//   }
//
//   void  removeUser() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.remove('Username');
//     prefs.remove('Password');
//     prefs.remove('token');
//   }
// }