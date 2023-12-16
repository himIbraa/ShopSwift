import 'package:flutter/material.dart';

class ContacScreen extends StatelessWidget {
  static const String routeName = '/contacts';

  const ContacScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ContacScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9E17E),
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: const Color(0xFFF5F5F5), // Background color
        margin: const EdgeInsets.all(40),
        child: SizedBox(
          height: 400, // Adjust the height as needed
          child: Card(
            color: Colors.white, // White card color
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListView.builder(
              itemCount: 4, // Set the number of boxes here
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/chat');
                    },
                    child: const GreyBoxWidget(
                      username: 'User name',
                      messagesCount: 4,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class GreyBoxWidget extends StatelessWidget {
  final String username;
  final int messagesCount;

  const GreyBoxWidget({super.key, required this.username, required this.messagesCount});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8.0),
      tileColor: const Color(0xFFEDF2FA), // Grey box color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      leading: Container(
        margin: const EdgeInsets.only(left: 20),
        child: const Icon(
          Icons.account_box_outlined,
          color: Colors.black,
          size: 55,
        ),
      ),
      title: Text(
        username,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: [
          Text(
            '+$messagesCount new messages',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8.0),
          Container(
            width: 10.0,
            height: 10.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
