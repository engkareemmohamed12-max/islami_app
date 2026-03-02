import 'package:flutter/material.dart';
import 'package:islami_app/Ui/Utils/app_colors.dart';

class AppTheme {


  static final ThemeData dartTheme = ThemeData(

    scaffoldBackgroundColor: AppColors.transparentColor,
    canvasColor: AppColors.primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(

      backgroundColor: AppColors.primaryColor,
      selectedItemColor: AppColors.blackColor,
      unselectedItemColor: AppColors.whiteColor,
    ),

  );

}