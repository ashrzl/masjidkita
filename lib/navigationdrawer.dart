import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = -1; // Variable to track the selected tile

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: _scaffoldKey,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.closeEndDrawer(); // Close the end drawer
            },
            icon: Icon(
              Icons.close,
              color: Color(0xFF6B2572),
            ),
          ),
          buildListTile(
            context,
            index: 0, // Assign index to each tile
            title: 'Kemaskini Profil',
            icon: Icons.person_outline,
            onTap: () {
              setState(() {
                _selectedIndex = 0; // Update selected index
              });
              // Add functionality for "Kemaskini Profil"
            },
          ),
          buildListTile(
            context,
            index: 1,
            title: 'Ubah Katalaluan',
            icon: Icons.lock_outline,
            onTap: () {
              setState(() {
                _selectedIndex = 1;
              });
              // Add functionality for "Ubah Katalaluan"
            },
          ),
          buildListTile(
            context,
            index: 2,
            title: 'Hubungi Kami',
            icon: Icons.phone_outlined,
            onTap: () {
              setState(() {
                _selectedIndex = 2;
              });
              // Add functionality for "Hubungi Kami"
            },
          ),
          buildListTile(
            context,
            index: 3,
            title: 'Bantuan',
            icon: Icons.help_outline,
            onTap: () {
              setState(() {
                _selectedIndex = 3;
              });
              // Add functionality for "Bantuan"
            },
          ),
        ],
      ),
    );
  }

  Widget buildListTile(
      BuildContext context, {
        required int index, // Add index for each ListTile
        required String title,
        required IconData icon,
        required Function onTap,
      }) {
    bool isSelected = _selectedIndex == index; // Check if this tile is selected
    return Card(
      color: isSelected ? Colors.purple : Colors.white, // Change color if selected
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.white: Colors.black, // Change text color
          ),
        ),
        leading: Icon(
          icon,
          color: isSelected ? Colors.white: Color(0xFF6B2572), // Change icon color
        ),
        onTap: () => onTap(), // Execute the onTap function
      ),
    );
  }
}