import 'package:flutter/material.dart';
import 'package:kasmini_app/presentation/app_theme.dart';
import 'package:kasmini_app/presentation/pages/main_page.dart';
import 'package:kasmini_app/core/service_locator.dart' as sl;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppTheme.backgroundColor,
        primaryColor: AppTheme.primaryColor,
        fontFamily: AppTheme.fontFamily,
        textTheme: AppTheme.textTheme,
        bottomNavigationBarTheme: AppTheme.bottomNavigationBarThemeData
      ),
      home: MainPage(),
    );
  }
}
