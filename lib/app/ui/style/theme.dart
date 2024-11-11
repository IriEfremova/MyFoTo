import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

final mainThemeData = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.grey,
    brightness: Brightness.light,
  ),
  textTheme: TextTheme(
    bodyMedium: GoogleFonts.montserrat(
      color: Colors.black,
      fontSize: 26,
    ),
    bodyLarge: GoogleFonts.oswald(
        color: Colors.black,
        fontSize: 30
    ),
    labelMedium: GoogleFonts.oswald(
        color: Colors.black,
        fontSize: 18
    ),
    labelSmall: GoogleFonts.oswald(
        color: Colors.black,
        fontSize: 12
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: CustomColors.light_grey,
      foregroundColor: Colors.black,
      textStyle: GoogleFonts.oswald(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  ),
);