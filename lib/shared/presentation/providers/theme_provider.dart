import 'package:flutter/material.dart';
import 'package:notacredito/shared/domain/theme/theme_factory.dart';
import 'package:notacredito/shared/infraestructure/theme/default_theme.dart';


class ThemeProvider extends ChangeNotifier{
  ThemeFactory _themeFactory;
  ThemeData? _cachedTheme;
  bool _isCreated = false;

  ThemeProvider() : _themeFactory = DefaultTheme();
  ThemeData get cachedTheme {
    return _cachedTheme ?? generate();
  }
  ThemeData generate() {
    // Verifica si el tema ya ha sido creado y almacenado en caché
    if (_isCreated && _cachedTheme != null) {
      return _cachedTheme!;
    }

    // Crea un nuevo tema y almacénalo en caché
    _cachedTheme = _themeFactory.createTheme();
    _isCreated = true;
    notifyListeners();
    return _cachedTheme!;
  }

  ThemeData changeTheme(ThemeFactory newThemeFactory) {
    // Actualiza la instancia de ThemeFactory con la nueva fábrica de temas
    _themeFactory = newThemeFactory;

    // Crea el nuevo tema y almacénalo en caché
    _cachedTheme = _themeFactory.createTheme();
    _isCreated = true;

    notifyListeners();

    // Devuelve el nuevo tema

    return _cachedTheme!;
  }
}
