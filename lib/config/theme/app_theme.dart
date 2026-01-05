// This file created for the all the primary color for application
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Define the primary color
  static const primaryColor = Color(0xFF38BDF8);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // Colors
    colorScheme:  ColorScheme.light(
      primary: primaryColor,
      secondary: Color(0xFF8E8E93),
      surface: Colors.white,
      onSurface: const Color.fromARGB(255, 226, 224, 224),
      // Adding complementary colors that work well with #acdde0
      tertiary:Color.fromARGB(255, 124, 210, 247), // Slightly darker shade for depth
      onPrimary:
          Colors.black87, // Dark text on primary color for better contrast
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    // // Message Bubbles
    // cardTheme: CardTheme(
    //   color: primaryColor.withOpacity(0.1),
    //   elevation: 0,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(16),
    //   ),
    // ),

    // // Icons
    // iconTheme: const IconThemeData(
    //   color: Colors.black87,
    //   size: 24,
    // ),

    // Text Themes
    textTheme:  TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppTheme.primaryColor,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        color: Colors.black87,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14,
        color: Colors.black87,
      ),
      labelMedium:GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.grey.shade600,
      ),
    ),

    // // Button Theme
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: primaryColor,
    //     foregroundColor: Colors.black87,
    //     elevation: 0,
    //     padding: const EdgeInsets.symmetric(vertical: 16),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(12),
    //     ),
    //     textStyle: const TextStyle(
    //       fontSize: 16,
    //       fontWeight: FontWeight.w600,
    //     ),
    //   ),
    // ),
  );
}
