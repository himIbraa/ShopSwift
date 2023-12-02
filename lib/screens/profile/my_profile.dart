import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  static const String routeName = '/myprofile';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => MyProfile(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        // Implement go back functionality
                      },
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 300, right: 300, top: 20, bottom: 20),
                      color: Color(0xFFF9E17E),
                      child: Text(
                        "My Profile",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite, color: Color(0xFFF5BA41)),
                      onPressed: () {
                        // Implement heart icon functionality
                      },
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child:
                          Icon(Icons.person, size: 40.0, color: Colors.black),
                    ),
                    SizedBox(height: 8.0),
                    Center(
                      child: Text(
                        'User Name',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                buildDetailBox('User Name', Icons.edit),
                buildDetailBox('email@email.com', Icons.edit),
                buildDetailBox('Address', Icons.edit),
                buildDetailBox('Phone number', Icons.edit),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: buildButton(
                          'Change Password'), // New layout for Change Password
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: buildButton('My Shop'), // New layout for My Shop
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color(0xFFF5BA41),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {
                  // Implement home button functionality
                },
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  // Implement cart button functionality
                },
              ),
              IconButton(
                icon: Icon(Icons.person, color: Colors.white),
                onPressed: () {
                  // Implement profile button functionality
                },
              ),
              IconButton(
                icon: Icon(Icons.list, color: Colors.white),
                onPressed: () {
                  // Implement listing button functionality
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailBox(String label, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Color(0xFF6592D1),
      ),
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
            child: IconButton(
              icon: Icon(icon, color: Colors.black),
              onPressed: () {
                // Implement modify functionality
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(String label) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Color(0xFF4A7FCA),
      ),
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
