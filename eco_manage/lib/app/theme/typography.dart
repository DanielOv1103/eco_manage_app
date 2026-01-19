import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextTheme k2dTextTheme([TextTheme? base]) {
    final b = base ?? const TextTheme();
    return GoogleFonts.k2dTextTheme(b).copyWith(

      titleLarge: GoogleFonts.k2d(fontWeight: FontWeight.w700),
      bodyMedium: GoogleFonts.k2d(fontWeight: FontWeight.w400),
    );
  }

  static String get fontFamily => GoogleFonts.k2d().fontFamily!;
}
