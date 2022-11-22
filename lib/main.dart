import 'package:flutter/material.dart';
import 'package:sketch_app/screens/bottom_navigation.dart';
import 'package:sketch_app/screens/drawing_screen.dart';
import 'package:sketch_app/screens/home_profile.dart';
import 'package:sketch_app/screens/login_page.dart';
import 'package:sketch_app/screens/recent_transac.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sketch App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavigation(),
    );
  }
}

