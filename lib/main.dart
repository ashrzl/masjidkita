import 'package:flutter/material.dart';
import 'package:test3/homepage.dart'; // Make sure this path is correct
import 'package:test3/splashscreen.dart'; // Make sure this path is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MasjidKita',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(), // Replace with LogScreen() if you want it as the main screen
    );
  }
}

class LogScreen extends StatefulWidget {
  const LogScreen({super.key, required this.title});

  final String title;

  @override
  _LogScreenState createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  final _UsernameController = TextEditingController();
  final _PasswordController = TextEditingController();

  bool _passwordVisible = false;
  bool _rememberMe = false;

  // Mock implementation of the loginUser function
  Future<bool> loginUser(String username, String password) async {
    // Simulate a login process (replace with actual logic)
    await Future.delayed(Duration(seconds: 2)); // Simulating network delay
    return username == 'namaPengguna' && password == 'password'; // Mock credentials
  }

  // Call this when the login button is pressed
  void _handleLogin() async {
    final Username = _UsernameController.text;
    final Password = _PasswordController.text;

    try {
      final success = await loginUser(Username, Password);
      if (success) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        // Handle login error (show a message, etc.)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed')),
        );
      }
    } catch (e) {
      // Handle any errors that may occur during login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Log Masuk',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Color(0xFF990099),
        elevation: 22,
        shape: RoundedRectangleBorder(
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
              SizedBox(height: 70),

              // UserName/Email text field
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _UsernameController,
                  decoration: InputDecoration(
                    labelText: 'Nama Pengguna / Email',
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Password Text Field
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _PasswordController,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    labelText: 'Katalaluan',
                    prefixIcon: Icon(Icons.lock_outline),
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
              SizedBox(height: 8.0),

              // Remember Me Checkbox
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
                  Text('Remember Me'),
                ],
              ),

              // Lupa Nama Pengguna atau Katalaluan?
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    // Add functionality for "Forgot Username or Password"
                  },
                  child: Text(
                    'Lupa Nama Pengguna atau Katalaluan?',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(height: 15),

              // Log Masuk Button
              ElevatedButton(
                onPressed: _handleLogin,
                child: Text(
                  'Log Masuk',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF990099),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),

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
                onPressed: () {
                  // Add functionality for Google Sign In
                },
                icon: Image.asset(
                  'assets/google.png',
                  height: 50.0,
                  colorBlendMode: BlendMode.srcIn,
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
