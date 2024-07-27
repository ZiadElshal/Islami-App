import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

/// light mode, dark mode
class MyThemeData {
  /// light mode
  static final ThemeData lightMode = ThemeData(
    primaryColor: AppColors.primaryLightColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.blackColor,
      unselectedItemColor: AppColors.whiteColor,
      backgroundColor: AppColors.primaryLightColor,
    ),
    textTheme: TextTheme(
      ///app title
      headlineLarge: TextStyle(
        color: AppColors.blackColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),

      ///main word of column
      bodyMedium: TextStyle(
        color: AppColors.blackColor,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),

      ///word in column
      bodySmall: TextStyle(
        color: AppColors.blackColor,
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),

      ///verses
      titleMedium: TextStyle(
        color: AppColors.blackColor,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),

      ///label of bottom Navigation Bar
      labelSmall: TextStyle(
        color: AppColors.blackColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  /// dark mode
  static final ThemeData darkMode = ThemeData(
    primaryColor: AppColors.primaryDarkColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.whiteColor)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.yellowColor,
      unselectedItemColor: AppColors.whiteColor,
      backgroundColor: AppColors.primaryDarkColor,
    ),
    textTheme: TextTheme(
      ///app title
      headlineLarge: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),

      ///main word of column
      bodyMedium: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),

      ///word in column
      bodySmall: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),

      ///verses
      titleMedium: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),

      ///label of bottom Navigation Bar
      labelSmall: TextStyle(
        color: AppColors.yellowColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
