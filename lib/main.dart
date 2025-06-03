import 'package:flutter/material.dart';
import 'package:app_repaso/screens/home_screen.dart';
import 'models/flashcard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Repaso',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(flashcards: []),
    );
  }
}