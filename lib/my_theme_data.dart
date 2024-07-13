import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

/// light mode, dark mode
class MyThemeData {
  static final ThemeData lightMode = ThemeData(
    primaryColor: AppColors.primaryLightColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 35),
      unselectedIconTheme: IconThemeData(size: 35),
      selectedItemColor: AppColors.blackColor,
      unselectedItemColor: AppColors.whiteColor,
      backgroundColor: AppColors.primaryLightColor,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.blackColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: AppColors.blackColor,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(
        color: AppColors.blackColor,
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        color: AppColors.blackColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        color: AppColors.blackColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
