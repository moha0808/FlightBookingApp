import 'package:flightbookingapp/bar.code.dart';
import 'package:flightbookingapp/message.dart';
import 'package:flightbookingapp/profilepage.dart';
import 'package:flightbookingapp/seat.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomeScreen()));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    ChatScreen(),
    ProfileScreen(),
    FlightTicketPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: 'Tickets',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/red.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/profile.jpg'),
                ),
              ),
              Positioned(
                top: 120,
                left: 20,
                child: Text(
                  'Hello! Mohan',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(labelText: 'From'),
                          ),
                          IconButton(
                            icon: Icon(Icons.swap_vert),
                            onPressed: () {},
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'To'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Suggestions for you',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SuggestionsPage()),
                          );
                        },
                        child: Text(
                          'View All →',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildSuggestionCard('images/france.jpg', '₹552828'),
                        SizedBox(width: 16),
                        buildSuggestionCard('images/kenya.jpg', '₹50528'),
                        SizedBox(width: 16),
                        buildSuggestionCard('images/singapore.jpg', '₹5585'),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Upcoming Trips',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UpcomingTripsPage()),
                          );
                        },
                        child: Text(
                          'View All →',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 300,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: [
                        buildUpcomingFlightCard(
                          context,
                          'images/bag.jpg',
                          'Flight to NYC',
                          'Depart: 2024-05-20',
                          'Flight No: AB123',
                          'From: JFK',
                          'To: LAX',
                        ),
                        buildUpcomingFlightCard(
                          context,
                          'images/bag.jpg',
                          'Flight to LAX',
                          'Depart: 2024-06-15',
                          'Flight No: CD456',
                          'From: LAX',
                          'To: JFK',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSuggestionCard(String imagePath, String title) {
    return Card(
      child: Stack(
        children: [
          Container(
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                backgroundColor: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUpcomingFlightCard(
      BuildContext context,
      String imagePath,
      String title,
      String subtitle,
      String flightNumber,
      String from,
      String to) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SeatAvailabilityScreen(title, subtitle, flightNumber, from, to),
          ),
        );
      },
      child: Card(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 32,
              left: 8,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  backgroundColor: Colors.black54,
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      backgroundColor: Colors.black54,
                    ),
                  ),
                  Text(
                    flightNumber,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      backgroundColor: Colors.black54,
                    ),
                  ),
                  Text(
                    from,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      backgroundColor: Colors.black54,
                    ),
                  ),
                  Text(
                    to,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      backgroundColor: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SuggestionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggestions'),
      ),
      body: Center(
        child: Text('All suggestions will be shown here'),
      ),
    );
  }
}

class UpcomingTripsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Trips'),
      ),
      body: Center(
        child: Text('All upcoming trips will be shown here'),
      ),
    );
  }
}
