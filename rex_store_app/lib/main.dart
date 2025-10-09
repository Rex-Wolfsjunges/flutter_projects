import 'package:flutter/material.dart';
import 'package:rex_store_app/views/pages/auth_pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rex's Multi-Store App",
      home: const LoginPage(),
    );
  }
}