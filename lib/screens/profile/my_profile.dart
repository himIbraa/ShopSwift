import 'package:flutter/material.dart';
import 'package:shopswift/widgets/widgets.dart';

class MyProfile extends StatelessWidget {
  static const String routeName = '/myprofile';

  const MyProfile({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const MyProfile(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'My Profile'),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(), // Disable scrolling
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 0),
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'User Name',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              buildDetailBox('User Name'),
              buildDetailBox('email@email.com'),
              buildDetailBox('Address'),
              buildDetailBox('Phone number'),
              const SizedBox(height: 20),
              buildButton('Change Password', () {}),
              const SizedBox(height: 1.0),
              buildButton('My Shop', () {
                Navigator.pushNamed(context, '/my-shop');
              }),
            ],
          ),
        ),
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
          Icon(Icons.edit, color: Colors.grey[500]),
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
