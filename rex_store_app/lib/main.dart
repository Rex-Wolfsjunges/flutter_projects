import 'package:flutter/material.dart';
import 'package:rex_store_app/core/configs/theme/app_theme.dart';
import 'package:rex_store_app/presentation/splash/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}