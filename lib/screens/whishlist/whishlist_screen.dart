import 'package:flutter/material.dart';
import 'package:shopswift/models/models.dart';
import 'package:shopswift/widgets/widgets.dart';

class WhishlistScreen extends StatelessWidget {
  static const String routeName = '/whishlist';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => WhishlistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist'),
      bottomNavigationBar: CustomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
                    SizedBox(height: 8.0), // Adjust the height for the gap
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
