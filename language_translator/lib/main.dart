import 'package:flutter/material.dart';
import 'package:language_translator/translator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Language Translator Application",
      debugShowCheckedModeBanner: false,
      home: const Translator(),
    );
  }
}