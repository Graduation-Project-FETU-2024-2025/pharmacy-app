import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/utils/app_styles.dart';

abstract class Themes {
  // static const Color _lightPrimaryColor = AppColors.primaryColor;
  static const Color _lightScaffoldColor = AppColors.white;
  static const Color _lightAppBarColor = AppColors.primaryColor;
  static const Color _lightElevatedButtonColor = AppColors.primaryColor;
  static const Color _foregroundTextColor = AppColors.white;

  static const Color _darkAppBarColor = Color(0xff1F1F1F);
  static const Color _darkPrimaryColor = Color(0xff292929);
  static const Color _darkElevatedButtonColor = Color(0xff2D88D6);

  static get lightTheme => ThemeData(
        scaffoldBackgroundColor: _lightScaffoldColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: _lightAppBarColor,
          foregroundColor: _foregroundTextColor,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(255, 55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: _lightElevatedButtonColor,
            foregroundColor: _foregroundTextColor,
            textStyle: const TextStyle(
                color: _foregroundTextColor,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xff4169E1).withOpacity(0.2),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: Color(0xff4169E1).withOpacity(0.2), width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: Color(0xff4169E1).withOpacity(0.2), width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: Color(0xffFA0909).withOpacity(0.3), width: 2),
          ),
          hintStyle: const TextStyle(color: Color(0xff4169E1)),
          labelStyle: const TextStyle(color: Color(0xff4169E1)),
          suffixIconColor: Colors.green, // Icon color
          prefixIconColor: Color(0xff4169E1),
          errorStyle: const TextStyle(color: Colors.red),
        ),
        textTheme: TextTheme(
          headlineLarge: AppStyles.semiBold40.copyWith(
            color: AppColors.primaryColor,
          ),
          headlineMedium: AppStyles.medium30.copyWith(
            color: AppColors.primaryColor,
          ),
          headlineSmall: AppStyles.semiBold20.copyWith(
            color: AppColors.primaryColor,
          ),
          titleLarge: AppStyles.semiBold20.copyWith(
            color: AppColors.black,
          ),
          titleMedium: AppStyles.semiBold15.copyWith(
            color: AppColors.black,
          ),
          titleSmall: AppStyles.semiBold12.copyWith(
            color: AppColors.black,
          ),
          displaySmall: AppStyles.semiBold10.copyWith(
            color: AppColors.primaryColor,
          ),
          displayMedium: AppStyles.semiBold15.copyWith(
            color: AppColors.black,
          ),
          bodySmall: AppStyles.semiBold10.copyWith(
            color: AppColors.black,
          ),
          bodyLarge: AppStyles.medium28.copyWith(
            color: AppColors.black.withOpacity(0.5),
          ),
          labelMedium: AppStyles.semiBold14.copyWith(
            color: AppColors.black,
          ),
          displayLarge: AppStyles.semiBold25.copyWith(
            color: AppColors.primaryColor,
          ),
          labelSmall: AppStyles.semiBold12.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      );

  static get darkTheme => ThemeData(
        scaffoldBackgroundColor: _darkPrimaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: _darkAppBarColor,
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: _darkElevatedButtonColor,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              color: Colors.white, // Text color for light theme
              fontSize: 25,
            ),
          ),
        ),
        // textTheme: TextTheme(
        //   bodySmall: AppFonts.regular14.copyWith(color: Colors.white),
        //   bodyLarge: AppFonts.regular16.copyWith(color: Colors.white),
        //   headlineSmall: AppFonts.semiBold20.copyWith(color: Colors.white),
        //   titleMedium: AppFonts.semiBold16.copyWith(color: Colors.white),
        //   labelSmall: AppFonts.semiBold12.copyWith(color: Colors.white),
        // ),

        //   inputDecorationTheme: InputDecorationTheme(
        //   filled: true,
        //   fillColor: Colors.transparent, // Dark background color
        //   contentPadding:
        //       const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        //   border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(10),
        //     borderSide: BorderSide(
        //         color: const Color(0xff4169E1).withOpacity(0.2), width: 0),
        //   ),
        //   enabledBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(10),
        //     borderSide: BorderSide(
        //         color: const Color(0xff4169E1).withOpacity(0.2), width: 0),
        //   ),
        //   focusedBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(10),
        //     borderSide: const BorderSide(color: Colors.grey, width: 1),
        //   ),
        //   errorBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(10),
        //     borderSide: const BorderSide(color: Colors.red, width: 0),
        //   ),
        //   focusedErrorBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(10),
        //     borderSide: BorderSide(
        //         color: const Color(0xffFA0909).withOpacity(0.3), width: 2),
        //   ),
        //   hintStyle: const TextStyle(
        //     color: Color(
        //         0xff9BB4F6), // Lighter blue for better visibility in dark mode
        //   ),
        //   labelStyle: const TextStyle(
        //     color: Color(0xff4169E1), // Blue for labels
        //   ),
        //   suffixIconColor: const Color(0xff6EE7B7), // Greenish tint for icons
        //   prefixIconColor: const Color(0xff4169E1),
        //   errorStyle: const TextStyle(color: Colors.red),
        // )
      );
}
