import 'package:flutter/material.dart';
import 'package:three_colors/screen/screen_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Three Colors App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            backgroundColor: const Color(0xFF3C3C3C),
            cardColor: const Color(0xFFD9D9D9),
            accentColor: const Color(0xFF9C9AED),
          ),
        ),
        home: const LoginScreen());
  }
}
