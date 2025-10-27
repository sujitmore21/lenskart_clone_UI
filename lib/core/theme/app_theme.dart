import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

/// App Theme Configuration
class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        background: AppColors.background,
        error: AppColors.error,
        onPrimary: AppColors.textWhite,
        onSecondary: AppColors.textWhite,
        onSurface: AppColors.textPrimary,
        onBackground: AppColors.textPrimary,
        onError: AppColors.textWhite,
      ),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: false,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: AppTextStyles.titleLarge(color: AppColors.textPrimary),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textWhite,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: AppTextStyles.button(),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          textStyle: AppTextStyles.button(),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: AppTextStyles.button(),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
        space: 1,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.displayLarge(),
        displayMedium: AppTextStyles.displayMedium(),
        displaySmall: AppTextStyles.displaySmall(),
        headlineLarge: AppTextStyles.headlineLarge(),
        headlineMedium: AppTextStyles.headlineMedium(),
        headlineSmall: AppTextStyles.headlineSmall(),
        titleLarge: AppTextStyles.titleLarge(),
        titleMedium: AppTextStyles.titleMedium(),
        titleSmall: AppTextStyles.titleSmall(),
        bodyLarge: AppTextStyles.bodyLarge(),
        bodyMedium: AppTextStyles.bodyMedium(),
        bodySmall: AppTextStyles.bodySmall(),
        labelLarge: AppTextStyles.labelLarge(),
        labelMedium: AppTextStyles.labelMedium(),
        labelSmall: AppTextStyles.labelSmall(),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: AppColors.primaryLight,
        secondary: AppColors.secondaryLight,
        surface: AppColors.surfaceDark,
        background: AppColors.backgroundDark,
        error: AppColors.error,
        onPrimary: AppColors.textWhite,
        onSecondary: AppColors.textWhite,
        onSurface: AppColors.textWhite,
        onBackground: AppColors.textWhite,
        onError: AppColors.textWhite,
      ),
      scaffoldBackgroundColor: AppColors.backgroundDark,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundDark,
        elevation: 0,
        centerTitle: false,
        iconTheme: const IconThemeData(color: AppColors.textWhite),
        titleTextStyle: AppTextStyles.titleLarge(color: AppColors.textWhite),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceDark,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.displayLarge(color: AppColors.textWhite),
        displayMedium: AppTextStyles.displayMedium(color: AppColors.textWhite),
        displaySmall: AppTextStyles.displaySmall(color: AppColors.textWhite),
        headlineLarge: AppTextStyles.headlineLarge(color: AppColors.textWhite),
        headlineMedium: AppTextStyles.headlineMedium(
          color: AppColors.textWhite,
        ),
        headlineSmall: AppTextStyles.headlineSmall(color: AppColors.textWhite),
        titleLarge: AppTextStyles.titleLarge(color: AppColors.textWhite),
        titleMedium: AppTextStyles.titleMedium(color: AppColors.textWhite),
        titleSmall: AppTextStyles.titleSmall(color: AppColors.textWhite),
        bodyLarge: AppTextStyles.bodyLarge(color: AppColors.textWhite),
        bodyMedium: AppTextStyles.bodyMedium(color: AppColors.textWhite),
        bodySmall: AppTextStyles.bodySmall(color: AppColors.textWhite),
        labelLarge: AppTextStyles.labelLarge(color: AppColors.textWhite),
        labelMedium: AppTextStyles.labelMedium(color: AppColors.textWhite),
        labelSmall: AppTextStyles.labelSmall(color: AppColors.textWhite),
      ),
    );
  }
}
