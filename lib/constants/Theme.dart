import 'package:flutter/material.dart';

import 'colors.dart';
import 'fonts.dart';

class AppTheme {
  static OutlineInputBorder whiteInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: AppColors.kWhite),
  );
  static OutlineInputBorder redInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: AppColors.kRed),
  );
   static OutlineInputBorder primaryColorInputBorder= OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide:   BorderSide(color: AppColors.kGrey.shade400),
  );
  static ButtonStyle elevatedButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.kWhite,
    foregroundColor: AppColors.kPrimaryColor,
    elevation: 5,
    fixedSize: const Size(340, 50),
  );
  static ButtonStyle darkElevatedButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.kPrimaryColor,
    foregroundColor: AppColors.kWhite,
    elevation: 5,
    fixedSize: const Size(340, 50),
  );
  static BoxDecoration boxDecoration = BoxDecoration(
    color: AppColors.kWhite,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: AppColors.kBlack54.withOpacity(0.25),
        blurRadius: 2,
        spreadRadius: 0.125,
        offset: const Offset(0, 0.3),
      )
    ],
  );
  static TextTheme textTheme = const TextTheme(
    titleLarge:  TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: AppColors.kPrimaryColor,
    ),
    titleMedium:  TextStyle(
        fontFamily: AppFonts.poppins,
        fontSize: 20,
        color: AppColors.kPrimaryColor,
        fontWeight: FontWeight.w600),

    bodyLarge:  TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 16,
      color: AppColors.kPrimaryColor,
    ),

    labelMedium:  TextStyle(
      color: AppColors.kGreyBackground,
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.w600,
    ),

  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      shadowColor: Colors.black.withOpacity(0.05),
      scaffoldBackgroundColor: AppColors.kWhite,

      // @Bahaaeddineg @yuufumi  fix the primary swatch color to be the same as the primary color
      // primarySwatch: const MaterialColor(
      //   0xFF1A2634,
      //   <int, Color>{
      //     50: Color(0xFF1A2634),
      //     100: Color(0xFF1A2634),
      //     200: Color(0xFF1A2634),
      //     300: Color(0xFF1A2634),
      //     400: Color(0xFF1A2634),
      //     500: Color(0xFF1A2634),
      //     600: Color(0xFF1A2634),
      //     700: Color(0xFF1A2634),
      //     800: Color(0xFF1A2634),
      //     900: Color(0xFF1A2634),
      //   },
      // ),

      primaryColor: AppColors.kPrimaryColor,

      textTheme: textTheme,

      // Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: elevatedButton,
      
      ),
      // Text Button

      // textButtonTheme: TextButtonThemeData()

      // Text Field
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.kWhite,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        enabledBorder: whiteInputBorder,
        focusedBorder: whiteInputBorder,
        errorBorder: redInputBorder,
        focusedErrorBorder: redInputBorder,
      ),
    );
  }
}
