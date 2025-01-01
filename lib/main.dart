import 'package:flutter/material.dart';
import 'package:kasmini_app/page/home.dart';
import 'package:kasmini_app/page/login.dart';
import 'package:kasmini_app/page/start.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartPage(),
    );
  }
}
