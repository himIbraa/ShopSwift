import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58.0, // Adjust the height as needed
      child: BottomAppBar(
        color: const Color(0xFFF5BA41),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/myprofile');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.apps,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/category');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.message,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/contacts');
              },
            ),
          ],
        ),
      ),
    );
  }
}
