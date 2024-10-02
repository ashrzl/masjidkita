import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFF5C0065),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.menu)
          ),
        ],
      ),
      body: Column(
        children: [
          //Search bar for "Carian Masjid"
          Container(
            padding: EdgeInsets.all(16.0),
            color: Color(0xFF5C0065),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Carian Masjid',
                    prefixIcon: Icon(Icons.search, color: Colors.grey,),
                    suffixIcon: Icon(Icons.mic, color: Colors.grey,),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
              ],
            ),
          ),
          
          //Profile Section
          Padding(
              padding: EdgeInsets.all(12.0),
            child: Row(
              children: [
                //Profile Image
                CircleAvatar(
                  radius: 40.0,
                ),
                SizedBox(width: 12),
                //Profile name and info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Abu Bakar',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5C0065)
                      ),
                    ),
                    Text('abubakar@gmail.com'),
                    Text('01234567890'),
                  ],
                ),
              ],
            ),
          ),
          //Icons section for different features
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMenuIcon(
                  Icons.schedule,
                  'Waktu Solat',
                  const Color(0xFF6B2572),
                ),
                _buildMenuIconWithImage(
                  'assets/qibla.png',
                  'Kiblat',
                  const Color(0xFF6B2572),
                ),
                _buildMenuIconWithImage(
                  'assets/read-quran.png',
                  'Al-Quran',
                  const Color(0xFF6B2572),
                ),
                _buildMenuIconWithImage(
                  'assets/hadith.png',
                  'Hadis',
                  const Color(0xFF6B2572),
                ),

                ],
                ),

            ),
        ],
      ),
    );
  }

  // Function to build the menu icons
  Widget _buildMenuIcon(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFECECEC),
          ),
          child: Icon(icon, size: 28, color: color),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildMenuIconWithImage(String assetPath, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFECECEC),
          ),
          child: Image.asset(assetPath, height: 28, width: 28, color: color),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.black54),
        ),
      ],
    );
  }



}