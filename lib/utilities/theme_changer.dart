import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeChanger {
  final themeStatus = GetStorage();
  final key = "isDarkMode";

  saveThemeStatus(bool isDarkMode) => themeStatus.write(key, isDarkMode);

  bool loadThemeStatus() => themeStatus.read(key) ?? false;
  ThemeMode get theme => loadThemeStatus() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(loadThemeStatus() ? ThemeMode.light : ThemeMode.dark);
    saveThemeStatus(!loadThemeStatus());
  }
}
