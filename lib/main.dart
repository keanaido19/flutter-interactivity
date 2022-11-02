import 'package:flutter/material.dart';
import 'package:funky_app/views/home.dart';

void main() {
  runApp(const FunkyApp());
}

class FunkyApp extends StatelessWidget {
  const FunkyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funky App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const FunkyHomeView(title: 'Make me Nice'),
    );
  }
}