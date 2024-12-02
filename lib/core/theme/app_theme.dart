
import 'package:flutter/material.dart';

abstract class Themes {
  static const Color _lightPrimaryColor = Color(0xffffffff);
  static const Color _lightAppBarColor = Color(0xffFEB62E);
  static const Color _lightElevatedButtonColor = Color(0xffFEB62E);

  static const Color _darkAppBarColor = Color(0xff1F1F1F);
  static const Color _darkPrimaryColor = Color(0xff292929);
  static const Color _darkElevatedButtonColor = Color(0xff2D88D6);

  static get lightTheme => ThemeData(
        scaffoldBackgroundColor: _lightPrimaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: _lightAppBarColor,
          foregroundColor: Colors.black,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: _lightElevatedButtonColor,
          foregroundColor: Colors.black,
          textStyle: const TextStyle(
            color: Colors.black, // Text color for light theme
            fontSize: 25,
          ),
        )),
        // textTheme: TextTheme(
        //   bodySmall: AppFonts.regular14.copyWith(color: Colors.black),
        //   bodyLarge: AppFonts.regular16.copyWith(color: Colors.black),
        //   headlineSmall: AppFonts.semiBold20.copyWith(color: Colors.black),
        //   titleMedium: AppFonts.semiBold16.copyWith(color: Colors.black),
        //   labelSmall: AppFonts.semiBold12.copyWith(color: Colors.black),
        // ),
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
      );
}