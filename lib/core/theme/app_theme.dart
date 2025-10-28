// lib/core/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors pulled from the CSS
  static const Color primaryTextColor = Color(0xFF0B0D11);
  static const Color secondaryTextColor = Color(0xFF313131);
  static const Color tertiaryTextColor = Color(0xFF545454);
  static const Color greyTextColor = Color(0xFF9C9C9C);
  static const Color blackColor = Color(0xFF000000);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color lightGreyBg = Color(0xFFF4F4F4);
  static const Color borderColor = Color(0xFFE1E1E1);
  static const Color blueAccent = Color(0xFF3B6ECC);
  static const Color greenAccent = Color(0xFFEDFFEE);


  static final TextTheme textTheme = TextTheme(

    headlineSmall: GoogleFonts.raleway(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF424242),
    ),
 
    titleLarge: GoogleFonts.raleway(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: primaryTextColor,
    ),

    bodyMedium: GoogleFonts.raleway(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: primaryTextColor,
      height: 1.5, // Corresponds to line-height: 24px
    ),

    bodySmall: GoogleFonts.raleway(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: primaryTextColor,
      height: 1.5, // Corresponds to line-height: 18px
    ),

    labelMedium: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: secondaryTextColor,
    ),
  );
}
