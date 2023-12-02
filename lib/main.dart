import 'package:flutter/material.dart';
import 'package:shopswift/config/app_router.dart';
import 'package:shopswift/config/theme.dart';
import 'package:shopswift/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop Swift',
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRouter,
      initialRoute: HomeScreen.routeName,
      home: HomeScreen(),
    );
  }
}
