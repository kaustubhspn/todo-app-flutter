import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'services/notification_services.dart';
import 'ui/pages/landing_page.dart';
import '../services/theme_services.dart';
import '../ui/theme.dart';

void main() async {
  // Ensure that all widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize notification helper
  await NotifyHelper.initialize();

  // Initialize GetStorage for local data storage
  await GetStorage.init();

  // Run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Set the app title
      title: 'ToDo',

      // Set the light theme
      theme: Themes.light_theme,

      // Set the dark theme
      darkTheme: Themes.dark_theme,

      // Set the current theme mode based on the user's preference
      themeMode: ThemeServices().theme,

      // Remove the debug banner in release mode
      debugShowCheckedModeBanner: false,

      // Set the home page to the landing page
      home: const LandingPage(),
    );
  }
}
