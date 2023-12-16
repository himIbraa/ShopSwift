import 'package:flutter/material.dart';
import 'package:shopswift/models/models.dart';
import 'package:shopswift/widgets/widgets.dart';

class WhishlistScreen extends StatelessWidget {
  static const String routeName = '/whishlist';

  const WhishlistScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const WhishlistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Wishlist'),
      bottomNavigationBar: const CustomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: Product.products.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ProductCard(
                      product: Product.products[index],
                      widthFactor: 1.1,
                      leftPosition: 160,
                      isWishlist: true,
                    ),
                    const SizedBox(height: 8.0), // Adjust the height for the gap
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
