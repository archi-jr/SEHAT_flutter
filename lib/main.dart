import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Pages/1st_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Use GetMaterialApp instead of MaterialApp to leverage GetX
      debugShowCheckedModeBanner: false,
      title: 'Flutter Navigation',
      theme: ThemeData.light(), // Light Theme by default
      darkTheme: ThemeData.dark(), // Dark Theme
      themeMode: ThemeMode.light, // Force light theme as the default
      // Home page is the login page
      home: const LoginPage(),
    );
  }
}

// The rest of the code remains unchanged (BiometricPage, ProfessionSelectionPage, etc.)
