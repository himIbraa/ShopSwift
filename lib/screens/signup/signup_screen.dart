import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // Adjust height and width as needed
                  width: 260,
                  height: 240,
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A7FCA),
                  ),
                ),
                SizedBox(height: 20),
                SignUpForm(),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check, color: Colors.black, size: 16),
                    SizedBox(width: 8),
                    Text(
                      'Receive Updates',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'By creating an account, you agree to our Terms of Service and Privacy Policy.',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // Handle "I have an account" click
                  },
                  child: Text(
                    'I have an account',
                    style: TextStyle(
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle Sign Up button click
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFF5BA41),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    // Handle Skip button click
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.black, width: 2.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTextField('Username', Icons.person),
        buildTextField('Email', Icons.email),
        buildTextField('Phone Number', Icons.phone),
        buildTextField('Password', Icons.lock),
        buildTextField('Confirm Password', Icons.lock),
      ],
    );
  }

  Widget buildTextField(String label, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: Colors.white, // Set background color to white
          prefixIcon: Container(
            width: 48,
            child: Row(
              children: [
                SizedBox(width: 10),
                Icon(icon, color: Colors.black),
                SizedBox(width: 8),
                Container(
                  width: 2,
                  height: 50, // Set the height to match the text field
                  color: Colors.black,
                ),
                SizedBox(width: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
