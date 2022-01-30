import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static final lightMode = ThemeData(
    primaryColor: Colors.blue,
  );

  static final darkMode = ThemeData(
    primaryColor: Colors.blue,
    brightness: Brightness.dark,
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.urbanist(
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle get headingStyle {
  return GoogleFonts.urbanist(
    textStyle: const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  );
}
