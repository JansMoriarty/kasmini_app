import 'package:flutter/material.dart';

class AppTheme {
  static const String fontFamily = 'Poppins';

  static const Color primaryColor = Color(0xff5755fe);
  static const Color secondaryColor = Colors.white;
  static const Color backgroundColor = Colors.white;
  static Color selectedBackgroundColor = Colors.black.withAlpha(10);
  static const Color shadowColor = Color.fromARGB(23, 0, 0, 0);

  static const BoxShadow boxShadow = BoxShadow(
    color: shadowColor,
    offset: Offset(0, -1.5),
    blurRadius: 6,
  );

  static const TextTheme textTheme = TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w300,
    ),
  );

  static BottomNavigationBarThemeData bottomNavigationBarThemeData =
      BottomNavigationBarThemeData(
    selectedItemColor: selectedBackgroundColor,
    backgroundColor: backgroundColor,
  );
}
