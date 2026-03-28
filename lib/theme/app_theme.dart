import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // French Republic colors
  static const Color bleuFrance = Color(0xFF002395);
  static const Color bleuLight = Color(0xFF1A4BC4);
  static const Color rougeFrance = Color(0xFFED2939);
  static const Color blanc = Color(0xFFFFFFFF);
  static const Color or = Color(0xFFFFCD00);

  // Neutrals
  static const Color bgColor = Color(0xFFF0F2F8);
  static const Color cardColor = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color borderColor = Color(0xFFE5E7EB);
  static const Color successColor = Color(0xFF22C55E);
  static const Color errorColor = Color(0xFFEF4444);

  // Module gradient palettes
  static const List<List<Color>> moduleGradients = [
    [Color(0xFF1E3D6E), Color(0xFF2563EB)],  // M1 Histoire - bleu profond
    [Color(0xFF14532D), Color(0xFF16A34A)],  // M2 Géographie - vert forêt
    [Color(0xFF7C2D12), Color(0xFFDC2626)],  // M3 Politique - rouge républicain
    [Color(0xFF4C1D95), Color(0xFF7C3AED)],  // M4 Valeurs - violet
    [Color(0xFF92400E), Color(0xFFD97706)],  // M5 Économie - ambre
    [Color(0xFF0C4A6E), Color(0xFF0EA5E9)],  // M6 Vie quotidienne - bleu ciel
    [Color(0xFF831843), Color(0xFFE11D48)],  // M7 Gastronomie - rose vif
    [Color(0xFF1E3A5F), Color(0xFF3B82F6)],  // M8 Arts - bleu acier
    [Color(0xFF064E3B), Color(0xFF059669)],  // M9 Cinéma - vert émeraude
    [Color(0xFF3B0764), Color(0xFF9333EA)],  // M10 Codes sociaux - mauve
  ];

  static ThemeData get lightTheme {
    final textTheme = GoogleFonts.nunitoTextTheme(
      const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: textPrimary),
        displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: textPrimary),
        headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: textPrimary),
        headlineMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: textPrimary),
        headlineSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: textPrimary),
        bodyLarge: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: textPrimary, height: 1.6),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: textPrimary, height: 1.5),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textSecondary),
        labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: bleuFrance),
        labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: textSecondary),
        labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: textSecondary),
      ),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: bleuFrance,
        primary: bleuFrance,
        secondary: rougeFrance,
        tertiary: or,
        surface: cardColor,
        background: bgColor,  // ignore: deprecated_member_use
        error: errorColor,
      ),
      textTheme: textTheme,
      scaffoldBackgroundColor: bgColor,
      appBarTheme: AppBarTheme(
        backgroundColor: bleuFrance,
        foregroundColor: blanc,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.nunito(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: blanc,
        ),
        iconTheme: const IconThemeData(color: blanc),
      ),
      cardTheme: CardTheme(
        color: cardColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: borderColor, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: bleuFrance,
          foregroundColor: blanc,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          textStyle: GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: bleuFrance, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: blanc,
        selectedItemColor: bleuFrance,
        unselectedItemColor: textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: bgColor,
        labelStyle: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
