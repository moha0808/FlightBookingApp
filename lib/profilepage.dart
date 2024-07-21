import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // returnz
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
                    image: AssetImage('images/profile_background.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                child: Positioned(
                  top: 40,
                  left: 20,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/profile.jpg'),
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 20,
                child: Text(
                  'Mohan Kumar',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                top: 150,
                left: 20,
                child: Text(
                  'Software Developer',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Text(
                        'Profile Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      buildProfileInfoRow(Icons.person, 'Username', 'Mohan Kumar'),
                      buildProfileInfoRow(Icons.email, 'Email', 'mohan@example.com'),
                      buildProfileInfoRow(Icons.phone, 'Contact', '+91 9876543210'),
                      buildProfileInfoRow(Icons.male, 'Gender', 'Male'),
                      buildProfileInfoRow(Icons.home, 'Native Place', 'Mumbai, India'),


                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle logout functionality here
                          },
                          child: Text('Logout'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProfileInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          SizedBox(width: 16),
          Text(
            '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStatCard(String title, String count) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              count,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
