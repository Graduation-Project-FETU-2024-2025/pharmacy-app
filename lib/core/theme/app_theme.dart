import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/utils/app_styles.dart';

abstract class Themes {
  static const Color _lightScaffoldColor = AppColors.white;
  static const Color _lightAppBarColor = AppColors.primaryColor;
  static const Color _foregroundTextColor = AppColors.white;

  static const Color _darkAppBarColor = Color(0xff1F1F1F);

  static get lightTheme => ThemeData(
        scaffoldBackgroundColor: _lightScaffoldColor,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: _lightAppBarColor,
          foregroundColor: _foregroundTextColor,
          centerTitle: true,
        ),
        textTheme: _customTextTheme(isDark: false),
        elevatedButtonTheme: _elevatedButtonTheme(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xffD9E1F9),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: _borderDecoration(color: const Color(0xffD9E1F9)),
          enabledBorder: _borderDecoration(color: const Color(0xffD9E1F9)),
          focusedBorder: _borderDecoration(color: Colors.black, width: 1),
          errorBorder: _borderDecoration(color: Colors.red),
          focusedErrorBorder: _borderDecoration(color: Colors.red, width: 2),
          hintStyle: const TextStyle(color: Color(0xff4169E1), fontSize: 18),
          labelStyle: const TextStyle(color: Color(0xff4169E1)),
          suffixIconColor: Colors.green,
          prefixIconColor: Color(0xff4169E1),
          errorStyle: const TextStyle(color: Colors.red),
        ),
      );

  static get darkTheme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: _darkAppBarColor,
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        textTheme: _customTextTheme(isDark: true),
        elevatedButtonTheme: _elevatedButtonTheme(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xff203470),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: _borderDecoration(color: const Color(0xff203470)),
          enabledBorder: _borderDecoration(color: const Color(0xff203470)),
          focusedBorder: _borderDecoration(color: Colors.white, width: 1),
          errorBorder: _borderDecoration(color: Colors.red),
          focusedErrorBorder: _borderDecoration(color: Colors.red),
          hintStyle: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          labelStyle: const TextStyle(color: Colors.white),
          suffixIconColor: Colors.green,
          prefixIconColor: Colors.white,
          errorStyle: const TextStyle(color: Colors.red),
        ),
      );

  static TextTheme _customTextTheme({required bool isDark}) {
    final primary = AppColors.primaryColor;
    final black = AppColors.black;
    final black50 = AppColors.black.withOpacity(0.5);

    final primaryOrWhite = isDark ? primary : primary;
    final blackOrWhite = isDark ? Colors.white : black;
    final black50OrWhite = isDark ? Colors.white70 : black50;

    return TextTheme(
      headlineLarge: AppStyles.semiBold40.copyWith(color: primaryOrWhite),
      headlineMedium: AppStyles.medium30.copyWith(color: primaryOrWhite),
      headlineSmall: AppStyles.semiBold20.copyWith(color: primaryOrWhite),
      titleLarge: AppStyles.semiBold20.copyWith(color: blackOrWhite),
      titleMedium: AppStyles.semiBold15.copyWith(color: blackOrWhite),
      titleSmall: AppStyles.semiBold12.copyWith(color: blackOrWhite),
      displaySmall: AppStyles.semiBold10.copyWith(color: primaryOrWhite),
      displayMedium: AppStyles.semiBold15.copyWith(color: blackOrWhite),
      displayLarge: AppStyles.semiBold25.copyWith(color: primaryOrWhite),
      bodySmall: AppStyles.semiBold10.copyWith(color: blackOrWhite),
      bodyLarge: AppStyles.medium28.copyWith(color: black50OrWhite),
      labelMedium: AppStyles.semiBold14.copyWith(color: blackOrWhite),
      labelSmall: AppStyles.semiBold12.copyWith(color: primaryOrWhite),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme({
    required Color backgroundColor,
    required Color foregroundColor,
  }) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(255, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }

  static OutlineInputBorder _borderDecoration({
    required Color color,
    double radius = 10,
    double width = 0,
  }) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(color: color, width: width),
      );
}
