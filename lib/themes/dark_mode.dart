import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    // ignore: deprecated_member_use
    background: Colors.grey.shade900,  // Dark background
    primary: Colors.grey.shade800,     // Dark primary color
    secondary: Colors.white,           // White as secondary for better contrast
    tertiary: Colors.black,            // Black tertiary for dark mode
    inversePrimary: Colors.grey.shade400, // Lighter grey for contrasts (like text or highlights)
  ),
);
