import 'package:flightbookingapp/homescreen.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-page background image
          Positioned.fill(
            child: Image.asset(
              'images/flight.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text("Enter the setup details in the account",style: TextStyle(fontStyle: FontStyle.normal,color: Colors.black),),
                    SizedBox(height: 40),
                    Card(
                      elevation: 8,
                      margin: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                controller: _usernameController,
                                decoration: InputDecoration(labelText: 'Username'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your username';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16),
                              TextFormField(
                                controller: _passwordController,
                                decoration: InputDecoration(labelText: 'Password'),
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomeScreen()),
                                  );
                                  if (_formKey.currentState!.validate()) {
                                    // Handle login logic
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Logging in...')),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: Text('Login',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,color: Colors.redAccent),),
                              ),
                              SizedBox(height: 16),
                              TextButton(
                                onPressed: () {

                                  // Handle forgot password
                                },
                                child: Text('Forgot Password?'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
