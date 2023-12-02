import 'package:flutter/material.dart';

class ContacScreen extends StatelessWidget {
  static const String routeName = '/chat';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => ContacScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF9E17E),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              // Handle back button press
            },
          ),
          title: Text(
            'Messages',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          color: Color(0xFFF5F5F5), // Background color
          margin: EdgeInsets.all(40),
          child: SizedBox(
            height: 400, // Adjust the height as needed
            child: Card(
              color: Colors.white, // White card color
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListView.builder(
                itemCount: 4, // Set the number of boxes here
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                    child: GreyBoxWidget(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GreyBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(8.0),
      tileColor: Color(0xFFEDF2FA), // Grey box color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      leading: Container(
        margin: EdgeInsets.only(left: 20),
        child: Icon(
          Icons.account_box_outlined,
          color: Colors.black,
          size: 55,
        ),
      ),
      title: Text(
        'Username',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: [
          Text(
            '+3 new messages',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 8.0),
          Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
