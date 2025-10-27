import 'package:flutter/material.dart';
import 'app_colors.dart';

/// App Text Styles - Consistent typography throughout the app
class AppTextStyles {
  AppTextStyles._();

  // Font Families - Using system fonts (null uses default)
  // To use custom fonts, set these to your font family names
  static const String? primaryFont = null; // System default
  static const String? secondaryFont = null; // System default

  // Display Styles
  static TextStyle displayLarge({Color? color}) => TextStyle(
    fontFamily: primaryFont,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: color,
    letterSpacing: -0.5,
  );

  static TextStyle displayMedium({Color? color}) => TextStyle(
    fontFamily: primaryFont,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: color,
    letterSpacing: -0.5,
  );

  static TextStyle displaySmall({Color? color}) => TextStyle(
    fontFamily: primaryFont,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: color,
    letterSpacing: -0.25,
  );

  // Headline Styles
  static TextStyle headlineLarge({Color? color}) => TextStyle(
    fontFamily: primaryFont,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: color,
    letterSpacing: 0,
  );

  static TextStyle headlineMedium({Color? color}) => TextStyle(
    fontFamily: primaryFont,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: color,
    letterSpacing: 0,
  );

  static TextStyle headlineSmall({Color? color}) => TextStyle(
    fontFamily: primaryFont,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: color,
    letterSpacing: 0,
  );

  // Title Styles
  static TextStyle titleLarge({Color? color}) => TextStyle(
    fontFamily: primaryFont,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: color,
    letterSpacing: 0.15,
  );

  static TextStyle titleMedium({Color? color}) => TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: color,
    letterSpacing: 0.15,
  );

  static TextStyle titleSmall({Color? color}) => TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: color,
    letterSpacing: 0.1,
  );

  // Body Styles
  static TextStyle bodyLarge({Color? color}) => TextStyle(
    fontFamily: secondaryFont,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: color,
    letterSpacing: 0.5,
  );

  static TextStyle bodyMedium({Color? color}) => TextStyle(
    fontFamily: secondaryFont,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: color,
    letterSpacing: 0.25,
  );

  static TextStyle bodySmall({Color? color}) => TextStyle(
    fontFamily: secondaryFont,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: color,
    letterSpacing: 0.4,
  );

  // Label Styles
  static TextStyle labelLarge({Color? color}) => TextStyle(
    fontFamily: secondaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: color,
    letterSpacing: 0.1,
  );

  static TextStyle labelMedium({Color? color}) => TextStyle(
    fontFamily: secondaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: color,
    letterSpacing: 0.5,
  );

  static TextStyle labelSmall({Color? color}) => TextStyle(
    fontFamily: secondaryFont,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: color,
    letterSpacing: 0.5,
  );

  // Custom Styles
  static TextStyle button({Color? color}) => TextStyle(
    fontFamily: secondaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: color,
    letterSpacing: 0.5,
  );

  static TextStyle caption({Color? color}) => TextStyle(
    fontFamily: secondaryFont,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: color,
    letterSpacing: 0.4,
  );

  static TextStyle overline({Color? color}) => TextStyle(
    fontFamily: secondaryFont,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: color,
    letterSpacing: 1.5,
  );

  // Price Styles
  static TextStyle priceLarge({Color? color}) => TextStyle(
    fontFamily: primaryFont,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: color ?? AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  static TextStyle priceMedium({Color? color}) => TextStyle(
    fontFamily: primaryFont,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: color ?? AppColors.textPrimary,
    letterSpacing: -0.25,
  );

  static TextStyle priceSmall({Color? color}) => TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.textPrimary,
    letterSpacing: 0,
  );

  // Discount Styles
  static TextStyle discount({Color? color}) => TextStyle(
    fontFamily: secondaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.success,
    letterSpacing: 0.25,
  );
}
