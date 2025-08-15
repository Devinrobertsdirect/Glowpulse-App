import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  // 🎨 Colors
  static const Color _primaryColor = Color(0xFFFF6B6B);
  static const Color _secondaryColor = Color(0xFFFF8E53);

  // Light Mode Colors
  static const Color _backgroundColorLight = Color(0xFFF5F5F5);
  static const Color _surfaceColorLight = Color(0xFFFFFFFF);
  static const Color _cardColorLight = Colors.white;

  // Dark Mode Colors
  static const Color _backgroundColorDark = Color(0xFF121212);
  static const Color _surfaceColorDark = Color(0xFF2C2C2C);
  static const Color _cardColorDark = Color(0xFF1E1E1E);

  static const Color _headingColor =  Color(0xFF333333);

  static Color get headingColor => _headingColor;
  static const Color _textBlackColor =  Color(0xFF000000);
  static const Color _appWhite =  Color(0xFFFFFFFF);

  static Color get appWhite => _appWhite;

  static Color get textBlackColor => _textBlackColor;
  static const Color _textColor =  Color(0xFF666666);
  static const Color _textColorGray =  Color(0xFF555555);
  static const Color _textColorLightGray =  Color(0xFF888888);
  static const Color _textColorLightGray2 =  Color(0xFF999999);

  static Color get textColorLightGray2 => _textColorLightGray2;

  static Color get textColorLightGray => _textColorLightGray;

  static Color get textColorGray => _textColorGray;

  static Color get textColor => _textColor;
  static const Color _labelColor =  Color(0xFFFFFFFF);
  static const Color _inputBorder =  Color(0xFFDDDDDD);
  static const Color _borderGrey =  Color(0xFFEEEEEE);
  static const Color _lightRedBg =  Color(0xFFfef4f4);
  static const Color _tableHeaderBd =  Color(0xFFf8f8f8);

  static Color get tableHeaderBg => _tableHeaderBd;

  static Color get lightRedBg => _lightRedBg;

  static Color get borderGrey => _borderGrey; // 🌞 **Light Theme**
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: _primaryColor,
    secondaryHeaderColor: _secondaryColor,
    scaffoldBackgroundColor: _backgroundColorLight,
    cardColor: _cardColorLight,
    colorScheme: ColorScheme.light(
      primary: _primaryColor,
      secondary: _secondaryColor,

      surface: _surfaceColorLight,
    ),
    fontFamily: GoogleFonts.inter().fontFamily,

    // 📝 **Typography**
    textTheme: TextTheme(
      displayLarge: GoogleFonts.inter(fontSize: 24.sp, fontWeight: FontWeight.bold, color:_headingColor),
      displayMedium: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.w600, color: _headingColor),
      titleLarge: GoogleFonts.inter(fontSize: 18.sp, fontWeight: FontWeight.w600, color:_headingColor),
      titleMedium: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500, color: _headingColor),
      headlineMedium: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.w600, color: _headingColor),
      headlineSmall: GoogleFonts.inter(fontSize: 18.sp, fontWeight: FontWeight.w600, color: _headingColor),
      bodyLarge: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w400, color: _textColor),
      bodyMedium: GoogleFonts.inter(fontSize: 12.sp, fontWeight: FontWeight.w400, color:_textColor),
      bodySmall: GoogleFonts.inter(fontSize: 10.sp, fontWeight: FontWeight.w400, color: _textColor),
      labelMedium: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500, color: _labelColor),
      labelSmall: GoogleFonts.inter(fontSize: 15.sp, fontWeight: FontWeight.w500, color: _labelColor),

    ),

      dividerTheme: DividerThemeData(
        color: _borderGrey,
        thickness: 1,

      ),
    // 📌 **AppBar Theme**
    appBarTheme: AppBarTheme(
      backgroundColor: _primaryColor,
      titleTextStyle: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.w600, color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 4,
    ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        fillColor: Colors.blue.withValues(alpha:0.2), // Background when selected
        selectedColor: _primaryColor, // Text/Icon color when selected
        color: _textColorGray, // Default text/icon color
        borderRadius: BorderRadius.circular(10), // Rounded corners
        borderColor: Colors.blue, // Border color
        selectedBorderColor: Colors.blueAccent, // Border when selected
      ),
    // 🖲 **Button Theme**
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,

        textStyle: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w600),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    ),

    // 📋 **TextField Theme**
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 15),
      hintStyle: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black54),
      fillColor: Colors.transparent, // Transparent background
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color:  _inputBorder, width: 1), // Red border
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color:  _primaryColor, width: 1.5), // Red border
      ),
    )

  );

  // 🌙 **Dark Theme**
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: _primaryColor,
    secondaryHeaderColor: _secondaryColor,
    scaffoldBackgroundColor: _backgroundColorDark,
    cardColor: _cardColorDark, // ✅ Dark mode card
    colorScheme: ColorScheme.dark(
      primary: _primaryColor,
      secondary: _secondaryColor,

      surface: _surfaceColorDark, // ✅ Darker surface
    ),
    fontFamily: GoogleFonts.inter().fontFamily, // ✅ Using poppins

    // 📝 **Typography**
    textTheme: TextTheme(
      displayLarge: GoogleFonts.inter(fontSize: 24.sp, fontWeight: FontWeight.bold, color: Colors.white),
      displayMedium: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.w600, color: Colors.white70),
      titleLarge: GoogleFonts.inter(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.white),
      titleMedium: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white70),
      headlineMedium: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.w600, color: Colors.white70),
      bodyLarge: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white60),
      bodyMedium: GoogleFonts.inter(fontSize: 12.sp, fontWeight: FontWeight.w400, color: Colors.white54),
      bodySmall: GoogleFonts.inter(fontSize: 10.sp, fontWeight: FontWeight.w400, color: Colors.white54),

    ),

    // 📌 **AppBar Theme**
    appBarTheme: AppBarTheme(
      backgroundColor: _surfaceColorDark, // ✅ Dark surface for AppBar
      titleTextStyle: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.w600, color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 4,
    ),

    // 🖲 **Button Theme**
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w600),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    ),

    // 📋 **TextField Theme**
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _surfaceColorDark, // ✅ Darker surface for input fields
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r), borderSide: BorderSide(color: _primaryColor)),
      hintStyle: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white38),
    ),
  );
}
