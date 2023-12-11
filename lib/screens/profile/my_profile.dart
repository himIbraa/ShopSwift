import 'package:flutter/material.dart';
import 'package:shopswift/widgets/widgets.dart';

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
    return Scaffold(
      appBar: CustomAppBar(title: 'My Profile'),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'User Name',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            buildDetailBox('User Name'),
            buildDetailBox('email@email.com'),
            buildDetailBox('Address'),
            buildDetailBox('Phone number'),
            SizedBox(height: 30),
            buildButton('Change Password', () {}),
            SizedBox(height: 16.0),
            buildButton('My Shop', () {
              Navigator.pushNamed(context, '/my-shop');
            }),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }

  Widget buildDetailBox(String label) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.grey[100],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18.0),
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
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.blue,
          border: Border.all(
            color: Color.fromARGB(255, 255, 255, 255),
            width: 1.0,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
