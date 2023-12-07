import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(400),
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: AppBar(
          backgroundColor: Color.fromARGB(0, 0, 0, 0),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            IconButton(
              icon: Icon(Icons.favorite),
              color: Color.fromARGB(255, 207, 187, 106),
              onPressed: () {
                Navigator.pushNamed(context, '/whishlist');
              },
            ),
          ],
          flexibleSpace: Container(
            // Add top padding here
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFF5BA41), width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFF9E17E),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18.0, vertical: 3),
                  child: Text(
                    this.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70); // Set the desired height here
}
