import 'package:flutter/material.dart';

class AppTheme {
  static const String fontFamily = 'Poppins';

  static const Color primaryColor = Color(0xff5755fe);
  static const Color secondaryColor = Colors.white;
  static const Color backgroundColor = Colors.white;
  static const Color selectedBackgroundColor = Color.fromARGB(10, 0, 0, 0);
  static const Color shadowColor = Color.fromARGB(23, 0, 0, 0);

  static const Color primaryTextColor = Colors.black87;
  static const Color secondaryTextColor = Colors.grey;

  static const BoxShadow boxShadow = BoxShadow(
    color: shadowColor,
    offset: Offset(0, -1.5),
    blurRadius: 6,
  );

  static const TextTheme textTheme = TextTheme(
    titleLarge: TextStyle(
      color: primaryTextColor,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      color: primaryTextColor,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      color: primaryTextColor,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),

    bodyLarge: TextStyle(
      color: primaryTextColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: primaryTextColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: primaryTextColor,
      fontSize: 12,
      fontWeight: FontWeight.w300,
    ),
    
  );

  static const BottomNavigationBarThemeData bottomNavigationBarThemeData =
      BottomNavigationBarThemeData(
    selectedItemColor: selectedBackgroundColor,
    backgroundColor: backgroundColor,
  );
}
