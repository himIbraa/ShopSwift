import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../widgets/widgets.dart';


class MyProfile extends StatefulWidget {
  static const String routeName = '/myprofile';

  const MyProfile({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const MyProfile(),
    );
  }

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'My Profile'),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 80), // Adjust this size to push content below the logout icon if needed
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Test2',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  buildDetailBox('Test2'),
                  buildDetailBox('test2@email.com'),
                  buildDetailBox('Enter your Address'),
                  buildDetailBox('Enter your Phone number'),
                  const SizedBox(height: 20),
                  buildButton('Change Password', () {}),
                  const SizedBox(height: 1.0),
                  buildButton('My Shop', () {
                    Navigator.pushNamed(context, '/my-shop');
                  }),
                  const SizedBox(height: 1.0),
                ],
              ),
            ),
          ),
          Positioned(
            top: AppBar().preferredSize.height, // Position right below the AppBar
            right: 16, // Right padding
            child: IconButton(
              icon: const Icon(Icons.logout, color: Colors.black),
              onPressed: () {
                // FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, '/login');
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }

  Widget buildDetailBox(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.grey[100],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18.0),
          ),
          const Icon(Icons.edit, color: Colors.grey),
        ],
      ),
    );
  }

  Widget buildButton(String label, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.blue,
          border: Border.all(
            color: const Color.fromARGB(255, 255, 255, 255),
            width: 1.0,
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
