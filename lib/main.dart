import 'package:flutter/material.dart';
import 'package:flutter_lessons/pages/iphone.dart';
import 'package:flutter_lessons/pages/iphone_grid.dart';

import 'pages/auth.dart';
import 'pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const AuthPage(),
        '/home': (context) => const HomePage(),
        '/iphone': (context) => const IphonePage(),
        '/iphone-grid': (context) => const IphoneGridPage(),
      },
    );
  }
}
