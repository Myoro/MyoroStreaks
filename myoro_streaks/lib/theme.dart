import 'package:flutter/material.dart';

const Color _darkColor = Color(0xFF181818);
const Color _lightColor = Color(0xFFEDE6D6);

TextStyle _textStyle(
  bool isDarkMode, {
  required double fontSize,
  FontWeight fontWeight = FontWeight.normal,
  FontStyle fontStyle = FontStyle.normal,
}) =>
    TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      color: isDarkMode ? _lightColor : _darkColor,
    );

ThemeData createTheme(bool isDarkMode) => ThemeData(
      colorScheme: ColorScheme(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        primary: isDarkMode ? _darkColor : _lightColor,
        onPrimary: isDarkMode ? _lightColor : _darkColor,
        error: Colors.red,
        onError: isDarkMode ? _darkColor : _lightColor,

        // Unused
        secondary: isDarkMode ? _darkColor : _lightColor,
        onSecondary: isDarkMode ? _lightColor : _darkColor,
        background: isDarkMode ? _darkColor : _lightColor,
        onBackground: isDarkMode ? _lightColor : _darkColor,
        surface: isDarkMode ? _darkColor : _lightColor,
        onSurface: isDarkMode ? _lightColor : _darkColor,
      ),
      textTheme: TextTheme(
        // Normal styles
        bodyLarge: _textStyle(isDarkMode, fontSize: 24),
        bodyMedium: _textStyle(isDarkMode, fontSize: 20),
        bodySmall: _textStyle(isDarkMode, fontSize: 16),
        // Bolded styles
        titleLarge:
            _textStyle(isDarkMode, fontSize: 24, fontWeight: FontWeight.bold),
        titleMedium:
            _textStyle(isDarkMode, fontSize: 20, fontWeight: FontWeight.bold),
        titleSmall:
            _textStyle(isDarkMode, fontSize: 16, fontWeight: FontWeight.bold),
        // Italicized styles
        headlineLarge:
            _textStyle(isDarkMode, fontSize: 24, fontStyle: FontStyle.italic),
        headlineMedium:
            _textStyle(isDarkMode, fontSize: 20, fontStyle: FontStyle.italic),
        headlineSmall:
            _textStyle(isDarkMode, fontSize: 16, fontStyle: FontStyle.italic),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: isDarkMode ? _lightColor : _darkColor,
        selectionColor: isDarkMode
            ? _lightColor.withOpacity(0.3)
            : _darkColor.withOpacity(0.3),
        selectionHandleColor: isDarkMode
            ? _lightColor.withOpacity(0.3)
            : _darkColor.withOpacity(0.3),
      ),
    );
