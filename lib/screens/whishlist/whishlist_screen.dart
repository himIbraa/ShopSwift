import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopswift/blocs/blocs.dart';
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
      body: BlocBuilder<WhishlistBloc, WhishlistState>(
        builder: (context, state) {
          if (state is WhishlistLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          if (state is WhishlistLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.whishlist.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          ProductCard(
                            product: state.whishlist.products[index],
                            widthFactor: 1.1,
                            leftPosition: 160,
                            isWishlist: true,
                          ),
                          const SizedBox(
                              height: 8.0), // Adjust the height for the gap
                        ],
                      );
                    },
                  ),
                ],
              ),
            );
          } else {
            return const Text('something went wrong');
          }
        },
      ),
    );
  }
}
