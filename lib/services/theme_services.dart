import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeServices {
  final GetStorage _box = GetStorage(); // Create a GetStorage instance
  final _key = 'isDarkMode'; // Set the key for the box

  // Getter to get the current theme mode from the box
  // Returns light mode if value is not set
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  // Method to save the theme mode to the box
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  // Method to load the theme mode from the box
  // Returns false (light mode) if value is not set
  bool _loadThemeFromBox() => _box.read<bool>(_key) ?? false;

  // Method to switch between dark and light mode
  void switchTheme() {
    // Get the current theme mode from the box and toggle it
    // Change the theme mode in GetX
    // Save the updated theme mode to the box
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
