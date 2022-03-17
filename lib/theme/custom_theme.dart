import 'dart:io';

import 'package:flutter/material.dart';
import 'colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        elevation: Platform.isIOS ? 1.0 : 4.0,
        centerTitle: false,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.primaryColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData();
  }
}
