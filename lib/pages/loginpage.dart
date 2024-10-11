import 'package:flutter/material.dart';
import 'package:test3/pages/homepage.dart';
import 'package:test3/services/api_service.dart'; // Make sure to import the HomePage

class LogScreen extends StatefulWidget {
  const LogScreen({super.key, required this.title});

  final String title;

  @override
  _LogScreenState createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final ApiService apiService = ApiService();
  bool isLoading = false;
  bool _passwordVisible = false;
  bool _rememberMe = false;

  // Future<void> _login() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //
  //   try {
  //     print("Attempting login...");
  //
  //     // Attempt login using the ApiService
  //     final response = await apiService.login(
  //       _usernameController.text,
  //       _passwordController.text,
  //     );
  //
  //     setState(() {
  //       isLoading = false;
  //     });
  //
  //     // Check for a successful response
  //     if (response.containsKey('token')) {
  //       print("Login successful: ${response['token']}");
  //       // Handle successful login (e.g., save token or navigate to another screen)
  //     } else {
  //       print("Login failed: ${response['error']}");
  //     }
  //   } catch (e) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     print("Error during login: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Log Masuk',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: const Color(0xFF990099),
        elevation: 22,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Nama Pengguna / Email',
                    prefixIcon: const Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    labelText: 'Katalaluan',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                  ),
                  const Text('Remember Me'),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {}, // Implement forgot password feature here
                  child: const Text(
                    'Lupa Nama Pengguna atau Katalaluan?',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage())
                  );
                },
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                  'Log Masuk',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF990099),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),

              // Or Divider
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.black26)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Atau Log Masuk'),
                  ),
                  Expanded(child: Divider(color: Colors.black26)),
                ],
              ),
              SizedBox(height: 30.0),

              // Google Sign In Button
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/google.png',
                  height: 50.0,
                  colorBlendMode: BlendMode.srcIn, // Specify the blending mode
                ),
              ),

              SizedBox(height: 20.0),

              // Daftar Text
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Tiada Akaun?',
                    style: TextStyle(color: Colors.black54),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Daftar',
                        style: TextStyle(
                          color: Color(0xFF5C0065),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}