import 'package:flutter/material.dart';
import 'package:razorpay_payment_gateway/razorpay_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Razorpay Payment Gateway App',
      debugShowCheckedModeBanner: false,
      home: const RazorpayPage(),
    );
  }
}