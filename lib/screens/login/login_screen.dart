

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shopswift/databases/dbhelper.dart';
import 'package:shopswift/models/models.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();





  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => LoginScreen(),
    );
  }

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
                Image.asset(
                  '',
                  width: 260,
                  height: 240,
                ),
                SizedBox(height: 10),
                LogInForm(),
                SizedBox(height: 10),

                SizedBox(height: 10),
                Text(
                  'By creating an account, you agree to our Terms of Service and Privacy Policy.',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                   //
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFF5BA41),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 15.0, // Adjusted height
                    ),
                    child: Text(
                      'LogIn',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.black, width: 2.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 15.0, // Adjusted height
                    ),
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Colors.black),
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

class LogInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSocial('Login with Facebook', Icons.facebook),
        buildSocial('Login with Google', Icons.circle),
        SizedBox(height: 10),
        Text(
          'OR',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4A7FCA),
          ),
        ),
        SizedBox(height: 0),
        Text(
          'Continue with email',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        SizedBox(height: 20),
        buildTextField('Email', Icons.email),
        buildTextField('Password', Icons.lock),
      ],
    );
  }

  Widget buildTextField(String label, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 8),
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
          fillColor: Colors.white,
          prefixIcon: buildPrefixIcon(icon),
        ),
      ),
    );
  }

  Widget buildPrefixIcon(IconData icon) {
    return Container(
      width: 48,
      child: Row(
        children: [
          SizedBox(width: 10),
          Icon(icon, color: Colors.black),
          SizedBox(width: 8),
          Container(
            width: 2,
            height: 50,
            color: Colors.black,
          ),
          SizedBox(width: 4),
        ],
      ),
    );
  }

  Widget buildSocial(String label, IconData icon) {

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 15),
      child: ElevatedButton(
        onPressed: () {
          // Handle button click
        },

        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.black,
          minimumSize: Size.fromHeight(60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
