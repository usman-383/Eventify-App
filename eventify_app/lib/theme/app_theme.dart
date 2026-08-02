import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primaryContainer: AppColors.primaryContainer,
        onPrimaryContainer: AppColors.onPrimaryContainer,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        secondaryContainer: AppColors.secondaryContainer,
        onSecondaryContainer: AppColors.onSecondaryContainer,
        tertiary: AppColors.tertiary,
        onTertiary: AppColors.onTertiary,
        tertiaryContainer: AppColors.tertiaryContainer,
        onTertiaryContainer: AppColors.onTertiaryContainer,
        error: AppColors.error,
        onError: AppColors.onError,
        errorContainer: AppColors.errorContainer,
        onErrorContainer: AppColors.onErrorContainer,
        background: AppColors.background,
        onBackground: AppColors.onBackground,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        surfaceVariant: AppColors.surfaceVariant,
        onSurfaceVariant: AppColors.onSurfaceVariant,
        outline: AppColors.outline,
        outlineVariant: AppColors.outlineVariant,
        shadow: Colors.black,
        inverseSurface: AppColors.inverseSurface,
        onInverseSurface: AppColors.inverseOnSurface,
        inversePrimary: AppColors.inversePrimary,
      ),
      scaffoldBackgroundColor: AppColors.background,
      textTheme: TextTheme(
        // displayLarge maps to display-xl
        displayLarge: GoogleFonts.plusJakartaSans(
          fontSize: 48,
          height: 56 / 48,
          letterSpacing: -0.02 * 48,
          fontWeight: FontWeight.w800,
        ),
        // displayMedium maps to display-xl-mobile
        displayMedium: GoogleFonts.plusJakartaSans(
          fontSize: 36,
          height: 44 / 36,
          letterSpacing: -0.02 * 36,
          fontWeight: FontWeight.w800,
        ),
        // headlineLarge maps to headline-lg
        headlineLarge: GoogleFonts.plusJakartaSans(
          fontSize: 32,
          height: 40 / 32,
          fontWeight: FontWeight.w700,
        ),
        // headlineMedium maps to headline-md
        headlineMedium: GoogleFonts.plusJakartaSans(
          fontSize: 24,
          height: 32 / 24,
          fontWeight: FontWeight.w700,
        ),
        // bodyLarge maps to body-lg
        bodyLarge: GoogleFonts.inter(
          fontSize: 18,
          height: 28 / 18,
          fontWeight: FontWeight.w400,
        ),
        // bodyMedium maps to body-md
        bodyMedium: GoogleFonts.inter(
          fontSize: 16,
          height: 24 / 16,
          fontWeight: FontWeight.w400,
        ),
        // labelLarge maps to label-bold
        labelLarge: GoogleFonts.inter(
          fontSize: 14,
          height: 20 / 14,
          letterSpacing: 0.05 * 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
