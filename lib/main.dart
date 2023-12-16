import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopswift/config/app_router.dart';
import 'package:shopswift/config/theme.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop Swift',
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRouter,
      initialRoute: WelcomeScreen.routeName,
      home: const WelcomeScreen(),
    );
  }
}
