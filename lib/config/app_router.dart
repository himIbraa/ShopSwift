import 'package:flutter/material.dart';
import 'package:shopswift/models/models.dart';
import 'package:shopswift/screens/chat/chat_screen.dart';
import 'package:shopswift/screens/login/login_screen.dart';
import 'package:shopswift/screens/order_confirmation/oreder_confirmation_screen.dart';
import 'package:shopswift/screens/screens.dart';

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
      case CategoryScreen.routeName:
        return CategoryScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case OrderConfirmation.routeName:
        return OrderConfirmation.route();
      case MyShop.routeName:
        return MyShop.route();
      case NewProductScreen.routeName:
        return NewProductScreen.route();
      case AdminProductScreen.routeName:
        return AdminProductScreen.route();
      case OrdersScreen.routeName:
        return OrdersScreen.route();
      case ChatScreen.routeName:
        return ChatScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case SignUpScreen.routeName:
        return SignUpScreen.route();
      case WelcomeScreen.routeName:
        return WelcomeScreen.route();
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
