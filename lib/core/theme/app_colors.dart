import 'package:flutter/material.dart';

/// App Color Scheme - Lenskart inspired colors
class AppColors {
  AppColors._();

  // Primary Colors - Lenskart brand color
  static const Color primary = Color(0xFF010045);
  static const Color primaryDark = Color(0xFF000028);
  static const Color primaryLight = Color(0xFF1A1A66);

  // Secondary Colors
  static const Color secondary = Color(0xFFFF6B35);
  static const Color secondaryDark = Color(0xFFE54F1F);
  static const Color secondaryLight = Color(0xFFFF8A61);

  // Background Colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF1A1A1A);
  static const Color surface = Color(0xFFF8F9FA);
  static const Color surfaceDark = Color(0xFF2C2C2C);

  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textTertiary = Color(0xFF9E9E9E);
  static const Color textWhite = Color(0xFFFFFFFF);

  // Accent Colors
  static const Color accent = Color(0xFFFFC107);
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);

  // Border Colors
  static const Color border = Color(0xFFE0E0E0);
  static const Color borderLight = Color(0xFFF5F5F5);
  static const Color borderDark = Color(0xFF424242);

  // Product Category Colors
  static const Color sunglasses = Color(0xFFFF6B35);
  static const Color eyeglasses = Color(0xFF010045);
  static const Color contactLenses = Color(0xFF4CAF50);
  static const Color eyeCare = Color(0xFF9C27B0);

  // Status Colors
  static const Color inStock = Color(0xFF4CAF50);
  static const Color outOfStock = Color(0xFFE53935);
  static const Color lowStock = Color(0xFFFF9800);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
