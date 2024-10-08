import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:test3/navigationdrawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0; // To track the selected index of BottomNavigationBar
  Position? _currentPosition; // Store the current position
  String _currentAddress = 'Fetching location...'; // Store the current address or coordinates

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index when tapped
    });
  }

  // Function to get current location and perform reverse geocoding
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, so we can't proceed.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try to ask for permissions again.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When permissions are granted, get the current position
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // Reverse geocoding to get the address
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemarks[0];

    // Format the address
    String address = '${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}';

    setState(() {
      _currentPosition = position;
      _currentAddress = address; // Set the formatted address
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation(); // Get location when the app starts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFF5C0065),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Lokasi Anda:", style: TextStyle(color: Colors.white)),
            Text(
              _currentAddress, // Display the current location (name/address)
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer(); // Open end drawer on click
            },
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ProfileScreen(), // Load ProfileScreen into the end drawer
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search bar for "Carian Masjid"
            Container(
              padding: EdgeInsets.all(16.0),
              color: Color(0xFF5C0065),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Carian Masjid',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(
                        Icons.mic,
                        color: Colors.grey,
                      ),
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

            // Profile Section
            Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                children: [
                  // Profile Image
                  CircleAvatar(
                    radius: 40.0,
                  ),
                  SizedBox(width: 12),
                  // Profile name and info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Abu Bakar',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5C0065)),
                      ),
                      Text('abubakar@gmail.com'),
                      Text('01234567890'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0),

            // Icons section for different features
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                child: Row(
                  children: [
                    _buildMenuIconWithImage(
                      'assets/solat.png',
                      'Waktu Solat',
                      const Color(0xFF6B2572),
                    ),
                    SizedBox(width: 16), // Add spacing between items
                    _buildMenuIconWithImage(
                      'assets/qibla.png',
                      'Kiblat',
                      const Color(0xFF6B2572),
                    ),
                    SizedBox(width: 16),
                    _buildMenuIconWithImage(
                      'assets/read-quran.png',
                      'Al-Quran',
                      const Color(0xFF6B2572),
                    ),
                    SizedBox(width: 16),
                    _buildMenuIconWithImage(
                      'assets/hadis.png',
                      'Hadis',
                      const Color(0xFF6B2572),
                    ),
                    SizedBox(width: 16),
                    _buildMenuIconWithImage(
                      'assets/kaabah.png',
                      'Haji & Umrah',
                      const Color(0xFF6B2572),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),

            // Tab Bar section
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const TabBar(
                    indicatorColor: Color(0xFF6B2572),
                    labelColor: Color(0xFF6B2572),
                    unselectedLabelColor: Colors.black54,
                    tabs: [
                      Text('Masjid Dilanggan'),
                      Text('Masjid Diikuti'),
                    ],
                  ),
                  Container(
                    height: 300, // Adjust height if needed
                    child: const TabBarView(
                      children: [
                        Center(
                          child: Text('Masjid Dilanggan'),
                        ),
                        Center(
                          child: Text('Masjid Diikuti'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Utama',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Carian Masjid',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex, // The currently selected index
        selectedItemColor: Color(0xFF6B2572), // The color of the selected item
        onTap: _onItemTapped, // Handle the tap on an item
      ),
    );
  }

  Widget _buildMenuIconWithImage(String assetPath, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Image.asset(assetPath, height: 50, width: 50, color: color),
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
