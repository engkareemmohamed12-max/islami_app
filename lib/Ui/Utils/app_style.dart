import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/Ui/Utils/app_colors.dart';

class AppStyle {

  static TextStyle bold16White = GoogleFonts.elMessiri(

    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
    fontSize: 16,

  );


  static TextStyle bold24black = GoogleFonts.elMessiri(

    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
    fontSize: 24,

  );

  static TextStyle bold14black = GoogleFonts.elMessiri(

    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
    fontSize: 14,

  );
}