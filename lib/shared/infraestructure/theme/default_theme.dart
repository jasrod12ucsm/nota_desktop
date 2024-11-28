
import 'package:flutter/material.dart';
import 'package:notacredito/shared/domain/theme/theme_factory.dart';
import 'package:notacredito/shared/infraestructure/theme/default_colors.dart';


class DefaultTheme extends ThemeFactory {
  late Color errorColor;
  late Color primaryColor;
  late Color secondaryColor;
  late Color surfaceColor;
  late Color tertiaryColor; // Color terciario
  late Color correctColor;

  DefaultTheme() {
    final defaultColors = DefaultColors();
    errorColor = defaultColors.errorColor;
    primaryColor = defaultColors.primaryColor;
    secondaryColor = defaultColors.secondaryColor;
    surfaceColor = defaultColors.surfaceColor ?? Colors.black;
    tertiaryColor = defaultColors.tertiaryColor;
    correctColor = defaultColors.correctColor;
  }

  @override
  ThemeData createTheme() {
    return ThemeData(
      fontFamily: "Segoe UI",
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
      colorScheme: ColorScheme(
        primary: primaryColor,
        onPrimary: Colors.white, // Texto sobre el color primario
        secondary: secondaryColor,
        onSecondary: Colors.black, // Texto sobre el color secundario
        surface: surfaceColor,
        onSurface: Colors.black, // Texto sobre el color de superficie
        error: errorColor,
        onError: Colors.white, // Texto sobre el color de error
        brightness: Brightness.dark,
        inversePrimary: const Color.fromRGBO(200, 200, 200, 1.0), // Color primario inverso (contrastante)
        inverseSurface: const Color.fromRGBO(30, 30, 30, 1.0), // Color de superficie inverso (contrastante)
        primaryContainer: primaryColor,
        secondaryContainer: secondaryColor,
        tertiaryContainer: tertiaryColor,
        onTertiary: Colors.white, // Texto sobre el color terciario
      ),
      primaryColor: primaryColor,
      brightness: Brightness.dark,
      primarySwatch: MaterialColor(
        primaryColor.value,
        <int, Color>{
          50: primaryColor.withOpacity(0.1),
          100: primaryColor.withOpacity(0.2),
          200: primaryColor.withOpacity(0.3),
          300: primaryColor.withOpacity(0.4),
          400: primaryColor.withOpacity(0.5),
          500: primaryColor.withOpacity(0.6),
          600: primaryColor.withOpacity(0.7),
          700: primaryColor.withOpacity(0.8),
          800: primaryColor.withOpacity(0.9),
          900: primaryColor.withOpacity(1.0),
        },
      ),
      highlightColor: correctColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor, // Color de fondo del botón
          foregroundColor: Colors.white, // Color del texto del botón
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor, // Color del texto del botón
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor, // Color del texto del botón
          side: BorderSide(color: primaryColor),
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: primaryColor,
          fontFamily: "Segoe UI",
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
        bodyMedium: TextStyle(
          color: primaryColor,
          fontFamily: "Segoe UI",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        bodySmall: TextStyle(
          color: primaryColor,
          fontFamily: "Segoe UI",
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        displayLarge: TextStyle(
          color: primaryColor,
          fontFamily: "Segoe UI",
          fontSize: 96,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
        ),
        displayMedium: TextStyle(
          color: primaryColor,
          fontFamily: "Segoe UI",
          fontSize: 60,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
        ),
        displaySmall: TextStyle(
          color: primaryColor,
          fontFamily: "Segoe UI",
          fontSize: 48,
          fontWeight: FontWeight.w600,
        ),
        headlineLarge: TextStyle(
          color: primaryColor,
          fontFamily: "Segoe UI",
          fontSize: 40,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        headlineMedium: TextStyle(
          color: primaryColor,
          fontFamily: "Segoe UI",
          fontSize: 34,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        headlineSmall: TextStyle(
          color: primaryColor,
          fontFamily: "Segoe UI",
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: primaryColor,
          fontFamily: "Segoe UI",
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
        labelMedium: TextStyle(
          color: primaryColor,
          fontFamily: "Segoe UI",
          fontSize: 11,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
        ),
        labelSmall: TextStyle(
          color: primaryColor,
          fontFamily: "Segoe UI",
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
        ),
        titleLarge: TextStyle(
          color: primaryColor,
          fontFamily: "Segoe UI",
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
        titleMedium: TextStyle(
          color: primaryColor,
          fontFamily: "Segoe UI",
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
        ),
        titleSmall: TextStyle(
          color: primaryColor,
          fontFamily: "Segoe UI",
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}