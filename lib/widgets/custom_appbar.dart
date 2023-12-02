import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10),
      child: AppBar(
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        title: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFF9E17E),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Text(
            this.title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              icon: Icon(Icons.favorite),
              color: Color(0xFFF9E17E),
              onPressed: () {
                Navigator.pushNamed(context, '/whishlist');
              })
        ],
        toolbarHeight: 100,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
