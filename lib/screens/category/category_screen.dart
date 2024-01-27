import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopswift/blocs/category/category_bloc.dart';
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
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Category',
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CategoryLoaded) {
            return SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      CategoryCard(
                        category: state.categories[index],
                        widthFactor: 1.1,
                      ),
                      const SizedBox(height: 18.0),
                    ],
                  );
                },
              ),
            );
          } else {
            return Text('something went wrong');
          }
        },
      ),
    );
  }
}
