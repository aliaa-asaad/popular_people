import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
   
    iconTheme: const IconThemeData(color: Colors.black),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Cairo',
    colorScheme: const ColorScheme.light(
      primary: Color(0xffd6a382),
      secondary: Color(0xffF0CDB7),
      background: Colors.black,
      brightness: Brightness.light,
      primaryContainer: Colors.white,
      secondaryContainer: Color(0xfff9f2d5),
    ),
  );
  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff181A20),
    iconTheme: const IconThemeData(color: Colors.white),
    colorScheme: const ColorScheme.dark(
      background: Colors.white,
      primaryContainer: Color(0xff1F222A),
      primary: Color(0xfff9f2d5),
      secondary: Color(0xffd6bf97),
      brightness: Brightness.dark,
      // background: Colors.
    ),
  );
}
