import 'package:flutter/material.dart';
import 'package:test3/navigationdrawer.dart';
import 'package:test3/pages/carianmasjid.dart';
import 'package:test3/pages/homepage.dart';

// Define the _SampleCard class
class _SampleCard extends StatelessWidget {
  const _SampleCard({required this.cardName});
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 100,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(cardName, style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}

class KariahPTC extends StatefulWidget {
  @override
  _KariahPTCState createState() => _KariahPTCState();
}

class _KariahPTCState extends State<KariahPTC> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CarianMasjid()),
        );
        break;
      case 2:
      // Navigate to the profile page (you'll need to create this)
        break;
    }
  }

  @override
  void initState() {
    super.initState();
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
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomePage()),
            // ); // Pop the current screen to go back
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer(); // Open end drawer on click
            },
            icon: Icon(Icons.menu, color: Colors.white),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ProfileScreen(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kariah PTC',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      _SampleCard(cardName: 'Sample Card 1'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(color: Colors.grey, thickness: 1),
                  SizedBox(height: 30),

                  DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        const TabBar(
                          indicatorColor: Color(0xFF6B2572),
                          labelColor: Color(0xFF6B2572),
                          unselectedLabelColor: Colors.black54,
                          tabs: [
                            Text('Sumbangan'),
                            Text('Bantuan'),
                          ],
                        ),
                        SizedBox(height: 30),
                        Container(
                          height: 300,
                          child: TabBarView(
                            children: [
                              ListView.builder(
                                itemCount: 5, // Number of cards for Sumbangan
                                itemBuilder: (context, index) {
                                  return _SampleCard(cardName: 'Sumbangan ${index + 1}');
                                },
                              ),
                              ListView.builder(
                                itemCount: 3, // Number of cards for Bantuan
                                itemBuilder: (context, index) {
                                  return _SampleCard(cardName: 'Bantuan ${index + 1}');
                                },
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
          ],
        ),
      ),
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
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF6B2572),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        onTap: _onItemTapped,
      ),
    );
  }
}
