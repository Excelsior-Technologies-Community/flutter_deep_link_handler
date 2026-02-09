import 'package:flutter/material.dart';
import 'package:flutter_deep_link_handler/screens/product_detail_screen.dart';
import 'navigation/app_navigator.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.key,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        '/profile': (context) => const ProfileScreen(),
        '/product': (context) => const ProductScreen(),
      },
    );
  }
}
