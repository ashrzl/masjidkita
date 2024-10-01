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
                _buildFeatureIcon('Waktu Solat', Icons.access_time),
                _buildFeatureIcon('Kiblat', Icons.explore),
                _buildFeatureIcon('Al-Quran', Icons.menu_book),
                _buildFeatureIcon('Hadis', Icons.book),
                _buildFeatureIcon(
                    'Haji & Umrah',
                    ImageIcon(AssetImage('assets/mosque.png')) as IconData
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//Features to build icons with label
Widget _buildFeatureIcon(String label, IconData icon){
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1.0,
                blurRadius: 5.0,
                offset: Offset(0,3) //change position of shadow
              ),
            ]
          ),
          child: Icon(icon, size: 30.0, color: Color(0xFF5C0065),),
        ),
        SizedBox(height: 8.0),
        Text(
          label,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
}





}