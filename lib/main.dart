import 'package:flutter/material.dart';
import 'package:test3/homepage.dart';

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
      home: const LogScreen(title: 'Log Masuk'),
    );
  }
}

class LogScreen extends StatelessWidget {
  const LogScreen ({super.key, required this.title});

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
        backgroundColor: Color(0xFF5C0065),
        elevation: 22,
        shadowColor: Colors.deepPurpleAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:  Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 70),

              //UserName/Email text field
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
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

              //Password Text Field
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Katalaluan',
                      prefixIcon:Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.visibility_off),
                        onPressed: () {  },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )
                  ),
                ),
              ),
              SizedBox(height: 8.0),

              //Remember Me Checkbox
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (bool? value){},
                  ),
                  Text('Remember Me'),
                ],
              ),
              //Lupa Nama Pengguna atau Katalaluan?
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Lupa Nama Pengguna atau Katalaluan?',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(height: 15),
              //Log Masuk Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );

                },
                child: Text(
                  'Log Masuk',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5C0065),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),

              //Or Divider
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.black26,)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Atau Log Masuk'),
                  ),
                  Expanded(child: Divider(color: Colors.black26,)),
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

              SizedBox(height: 20.0,),

              //Daftar Text
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Tiada Akaun?',
                    style: TextStyle(color: Colors.black54),
                    children: <TextSpan> [
                      TextSpan(
                        text: 'Daftar',
                        style: TextStyle(
                          color:Color(0xFF5C0065),
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
  final String title;
}


