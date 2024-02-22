import 'package:flutter/material.dart';

class MyThemeData{
  static Color primaryBlue = Colors.teal.shade600;
  static Color green = const Color(0xFF84F878);
  static Color red = const Color(0xFFEC4B4B);
  static Color white = const Color(0xFFFFFFFF);
  static Color black = const Color(0xFF383838);
  static Color background = const Color(0xFFFFFFFF);


  static ThemeData light = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(primaryBlue))),
    scaffoldBackgroundColor: MyThemeData.background,
    appBarTheme: AppBarTheme(
        color: primaryBlue,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(
            color: white
        )
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
          fontSize: 30, color: white, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          fontSize: 20, color: primaryBlue, fontWeight: FontWeight.w400),
      bodyLarge: TextStyle(
          fontSize: 12,
          color: black
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: white,
      unselectedItemColor: black,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent,
    ),
bottomAppBarTheme: BottomAppBarTheme(color: primaryBlue),
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: primaryBlue)
  );

}