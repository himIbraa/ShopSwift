import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopswift/config/app_router.dart';
import 'package:shopswift/config/theme.dart';
import 'package:shopswift/blocs/blocs.dart';
import 'package:shopswift/firebase_options.dart';
import 'package:shopswift/simple_bloc_observer.dart';
import 'repositories/repositories.dart';
import 'screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WhishlistBloc()..add(StartWhishlist())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(
              LoadCategories(),
            ),
        ),
        BlocProvider(
          create: (_) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(
              LoadProducts(),
            ),
        ),
      ],
      child: MaterialApp(
        title: 'Shop Swift',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRouter,
        initialRoute: WelcomeScreen.routeName,
        home: const WelcomeScreen(),
      ),
    );
  }
}
