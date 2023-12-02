import 'package:flutter/material.dart';
import 'package:shopswift/models/category_model.dart';
import 'package:shopswift/models/product_model.dart';
import 'package:shopswift/screens/cart/cart_screen.dart';
import 'package:shopswift/screens/catalog/catalog_screen.dart';
import 'package:shopswift/screens/product/product_screen.dart';
import 'package:shopswift/screens/profile/my_profile.dart';
import 'package:shopswift/screens/screens.dart';
import 'package:shopswift/screens/whishlist/whishlist_screen.dart';
import '../screens/home/home_screen.dart';

class AppRouter {
  static Route onGenerateRouter(RouteSettings settings) {
    print('This is route: ${settings.name}');
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case WhishlistScreen.routeName:
        return WhishlistScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case ContacScreen.routeName:
        return ContacScreen.route();
      case MyProfile.routeName:
        return MyProfile.route();
      default:
        return _errorRoute();
    }
  }

  static _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text("ERROR")),
      ),
    );
  }
}
