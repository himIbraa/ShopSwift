import 'package:flutter/material.dart';
import 'package:shopswift/config/app_router.dart';
import 'package:shopswift/config/theme.dart';
import 'screens/screens.dart';

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
      initialRoute: WelcomeScreen.routeName,
      home: WelcomeScreen(),
    );
  }
}
