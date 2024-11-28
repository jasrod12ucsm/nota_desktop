
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:notacredito/shared/infraestructure/theme/default_theme.dart';


class ThemeController extends GetxController {
  // Observable para manejar el tema
  Rx<ThemeData> _themeData = ThemeData().obs;

  ThemeData get themeData => _themeData.value;

  @override
  void onInit() {
    super.onInit();
    _themeData.value = DefaultTheme().createTheme(); // Inicializa el tema
  }

  // Método para actualizar el tema si es necesario
  void updateTheme(ThemeData newTheme) {
    _themeData.value = newTheme;
  }
}