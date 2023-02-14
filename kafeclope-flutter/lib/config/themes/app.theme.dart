import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData light = ThemeData(
    primaryColor: Color.fromRGBO(26, 147, 11, 100),
    primarySwatch: Colors.green,
    textTheme: TextTheme(
      displaySmall: GoogleFonts.amaranth(fontSize: 36),
      headlineSmall: GoogleFonts.amaranth(
        fontSize: 24,
      ),
    ),
  );

  ThemeData dark = ThemeData(
    primarySwatch: Colors.green,
    primaryColor: Colors.green,
  );
}
