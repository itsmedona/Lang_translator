import 'package:flutter/material.dart';
import 'view/home_page/home_page.dart';

void main() {
  runApp(TranslatorApp());
}
class TranslatorApp extends StatelessWidget {
  const TranslatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}