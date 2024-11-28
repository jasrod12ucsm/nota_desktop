import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:notacredito/Menu/presentation/menu.dart';
import 'package:notacredito/shared/infraestructure/theme/theme_controller.dart';
import 'package:rinf/rinf.dart';
import './messages/generated.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  await initializeRust(assignRustSignal);
  Get.put(ThemeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final themeController = Get.find<ThemeController>();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        MonthYearPickerLocalizations.delegate, // Añade el delegado aquí
      ],
      supportedLocales: const [
        Locale('en', ''), // Puedes añadir más locales si es necesario
      ],
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Desktop App',
      home: Menu(),
      theme: themeController.themeData,
    );
  }
}
