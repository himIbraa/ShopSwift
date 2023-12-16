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
      preferredSize: const Size.fromHeight(70), // Adjust the desired height here
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: AppBar(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite),
              color: const Color.fromARGB(255, 207, 187, 106),
              onPressed: () {
                Navigator.pushNamed(context, '/whishlist');
              },
            ),
          ],
          flexibleSpace: Container(
            // Add top padding here
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(top: 20),

                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFF5BA41), width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFFF9E17E),
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SizedBox(
                      width: 140, // Set your desired fixed width
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1, // Adjust the number of lines you want to show
                      ),
                    ),
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
  Size get preferredSize => const Size.fromHeight(70); // Set the desired height here
}
