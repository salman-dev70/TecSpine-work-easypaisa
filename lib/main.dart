import 'package:easy_paisa/controller/bottomNav_controller.dart';
import 'package:easy_paisa/controller/language_controller.dart';
import 'package:easy_paisa/controller/theme_controller.dart';
import 'package:easy_paisa/view/homescreen/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());
  final LanguageController languageController = Get.put(LanguageController());
  final BottomnavController bottomNavController = Get.put(
    BottomnavController(),
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Easypaisa',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.green[800],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[800],
          foregroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey[900],
          selectedItemColor: Colors.green[400],
          unselectedItemColor: Colors.grey[400],
        ),
        cardTheme: CardTheme(color: Colors.grey[800]),
      ),
      themeMode: ThemeMode.system,
      locale: languageController.locale.value,
      fallbackLocale: const Locale('en', 'US'),
      translations: AppTranslations(),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppTranslations extends Translations {
  final LanguageController languageController = Get.find();

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': languageController.keys['en_US']!,
    'ur_PK': languageController.keys['ur_PK']!,
  };
}
