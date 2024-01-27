import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopswift/blocs/product/product_bloc.dart';
import 'package:shopswift/models/models.dart';
import 'package:shopswift/widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  final Category category;
  const CatalogScreen({super.key, required this.category});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: category.name),
        bottomNavigationBar: const CustomNavBar(),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductLoaded) {
              return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.15),
                itemCount: state.products
                    .where((product) => product.category == category.name)
                    .toList()
                    .length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: ProductCard(
                      product: state.products
                          .where((product) => product.category == category.name)
                          .toList()[index],
                      widthFactor: 2.2,
                    ),
                  );
                },
              );
            } else {
              return Text('something went wrong');
            }
          },
        ));
  }
}
