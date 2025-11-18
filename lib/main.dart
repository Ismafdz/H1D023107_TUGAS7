import 'package:flutter/material.dart';
import 'package:h1d023107_tugas7/pages/splash_screen.dart';
import 'package:h1d023107_tugas7/pages/login_page.dart';
import 'package:h1d023107_tugas7/pages/register_page.dart';
import 'package:h1d023107_tugas7/pages/home_page.dart';
import 'package:h1d023107_tugas7/pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 7 Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}