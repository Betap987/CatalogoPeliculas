
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peliculas_app/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primario,
        surface: AppColors.fondo,
      ),
    );

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.fondo,
      textTheme: GoogleFonts.poppinsTextTheme(base.textTheme).apply(
        bodyColor: AppColors.texto,
        displayColor: AppColors.texto,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.fondo,
        foregroundColor: AppColors.texto,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.texto,
        ),
      ),
    );
  }
}
