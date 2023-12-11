import 'package:flutter/material.dart';
import 'package:shopswift/models/models.dart';
import 'package:shopswift/widgets/widgets.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = '/category';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CategoryScreen(),
    );
  }

  const CategoryScreen();

  @override
  Widget build(BuildContext context) {
    final List<Category> category = Category.categories.toList();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Category',
      ),
      bottomNavigationBar: CustomNavBar(),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: category.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                CategoryCard(
                  category: category[index],
                  widthFactor: 1.1,
                ),
                SizedBox(height: 18.0),
              ],
            );
          },
        ),
      ),
    );
  }
}
