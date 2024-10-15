import 'package:flutter/material.dart';
import 'package:test3/pages/kariahptc.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = -1; // Variable to track the selected tile
  bool _isLogoutPressed = false; // Track if logout button is pressed

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: _scaffoldKey,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          buildListTile(
              context,
              index: 4,
              title: 'Kariah PTC',
              icon: Icons.mosque,
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => KariahPTC())
                );
                setState(() {
                  _selectedIndex = 4;
                });
              }
          ),
          Spacer(), // Add this to push the logout button to the bottom
          buildLogoutButton(context), // Add the logout button here
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
            color: isSelected ? Colors.white : Colors.black, // Change text color
          ),
        ),
        leading: Icon(
          icon,
          color: isSelected ? Colors.white : Color(0xFF6B2572), // Change icon color
        ),
        onTap: () => onTap(), // Execute the onTap function
      ),
    );
  }

  Widget buildLogoutButton(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            _isLogoutPressed = true; // Set pressed state to true
          });
        },
        onTapUp: (_) {
          setState(() {
            _isLogoutPressed = false; // Reset pressed state
          });
          // Add your logout functionality here
          print("Logged out");
        },
        onTapCancel: () {
          setState(() {
            _isLogoutPressed = false; // Reset pressed state
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min, // Ensures the button shrinks to fit content
            mainAxisAlignment: MainAxisAlignment.center, // Center the icon and text
            children: [
              Icon(
                Icons.logout,
                color: _isLogoutPressed ? Colors.purple : Colors.black, // Change color based on press state
              ),
              SizedBox(width: 8), // Add spacing between icon and text
              Text(
                'Logout',
                style: TextStyle(
                  fontSize: 16,
                  color: _isLogoutPressed ? Colors.purple : Colors.black, // Change color based on press state
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
