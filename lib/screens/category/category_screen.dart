import 'package:flutter/material.dart';
import 'package:shopswift/models/models.dart';
import 'package:shopswift/widgets/widgets.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = '/category';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CategoryScreen(),
    );
  }

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Category> category = Category.categories.toList();

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Category',
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: category.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                CategoryCard(
                  category: category[index],
                  widthFactor: 1.1,
                ),
                const SizedBox(height: 18.0),
              ],
            );
          },
        ),
      ),
    );
  }
}
