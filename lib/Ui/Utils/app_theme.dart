import 'package:flutter/material.dart';
import 'package:islami_app/Ui/Utils/app_colors.dart';

class AppTheme {


  static final ThemeData dartTheme = ThemeData(

    scaffoldBackgroundColor: AppColors.transparentColor,
    canvasColor: AppColors.primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(

      backgroundColor: AppColors.primaryColor,
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor,
    ),
    textTheme: TextTheme(

      headlineSmall: TextStyle(

        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
        fontSize: 16,
      ),

    ),

  );

}