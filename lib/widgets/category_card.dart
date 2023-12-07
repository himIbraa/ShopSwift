import 'package:flutter/material.dart';
import 'package:shopswift/models/models.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final double widthFactor;
  final double leftPosition;

  const CategoryCard({
    required this.category,
    this.widthFactor = 2.5,
    this.leftPosition = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/catalog', arguments: category);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / widthFactor,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(category.imgURL),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: leftPosition,
              child: Container(
                width: MediaQuery.of(context).size.width / widthFactor -
                    leftPosition,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(0, 26, 48, 210),
                      Color.fromRGBO(19, 13, 137, 0.9),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
