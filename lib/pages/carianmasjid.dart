import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:test3/navigationdrawer.dart';  // Adjust to your file structure
import 'package:test3/pages/homepage.dart';    // Adjust to your file structure

class CarianMasjid extends StatefulWidget {
  @override
  _CarianMasjidState createState() => _CarianMasjidState();
}

class _CarianMasjidState extends State<CarianMasjid> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 1; // Default to the second item
  Position? _currentPosition;
  String _currentAddress = 'Fetching location...';
  List<String> _mosqueResults = []; // Store mosque results

  // Replace with your actual Google API Key
  static const String apiKey = 'YOUR_GOOGLE_API_KEY';

  // Function to get the user's current location
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Get the current position when permissions are granted
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Reverse geocoding to get the address
    List<Placemark> placemarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    String address =
        '${place.locality}, ${place.administrativeArea}, ${place.country}';

    setState(() {
      _currentPosition = position;
      _currentAddress = address; // Set the formatted address
    });

    // Search for nearby mosques after location is fetched
    await _searchMosquesNearby();
  }

  // Function to call an external API to search for mosques nearby
  Future<void> _searchMosquesNearby() async {
    if (_currentPosition != null) {
      final double latitude = _currentPosition!.latitude;
      final double longitude = _currentPosition!.longitude;

      final String url =
          'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=5000&type=mosque&key=$apiKey';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<dynamic> results = data['results'];

        setState(() {
          _mosqueResults = results
              .map((result) => result['name'].toString())
              .toList(); // Get the names of the mosques
        });
      } else {
        print('Failed to load mosque data');
      }
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });

    // Navigate based on the selected index
    switch (index) {
      case 0:
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => HomePage()),
        // );
        break;
      case 1:
      // Stay on the current page (CarianMasjid)
        break;
      case 2:
      // Navigate to the profile page (you'll need to create this)
        break;
    }
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
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFF5C0065),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomePage()),
            // );// Pop the current screen to go back
          },
        ),
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
        child: ProfileScreen(), // Load ProfileScreen into the end drawer (you can replace it)
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search bar for "Carian Masjid"
            Container(
              padding: const EdgeInsets.all(16.0),
              color: const Color(0xFF5C0065),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Carian Masjid',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      suffixIcon: const Icon(
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
                  const SizedBox(height: 15.0),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Carian Masjid',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Text(
                      'Jumlah Masjid Dijumpai: ${_mosqueResults.length}',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    // Display search results
                    _mosqueResults.isNotEmpty
                        ? ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _mosqueResults.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_mosqueResults[index]),
                        );
                      },
                    )
                        : Text('Tiada Masjid dijumpai.'),
                  ],
                ),
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
        unselectedItemColor: Colors.grey, // The color of the unselected items
        selectedLabelStyle:
        TextStyle(fontWeight: FontWeight.bold), // Style for selected label
        unselectedLabelStyle:
        TextStyle(color: Colors.grey), // Style for unselected label
        onTap: _onItemTapped, // Handle the tap on an item
      ),
    );
  }
}
