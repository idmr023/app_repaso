import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class StudyScreen extends StatefulWidget {
  final List<Flashcard> flashcards;

  const StudyScreen({super.key, required this.flashcards});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  int _index = 0;
  bool _showAnswer = false;

  void _nextCard() {
    setState(() {
      _index = (_index + 1) % widget.flashcards.length;
      _showAnswer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.flashcards.isEmpty) {
      return const Scaffold(
        body: Center(child: Text('No hay tarjetas')),
      );
    }

    final card = widget.flashcards[_index];

    return Scaffold(
      appBar: AppBar(title: const Text('Estudiar')),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _showAnswer = !_showAnswer;
          });
        },
        child: Center(
          child: Card(
            elevation: 8,
            margin: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(30),
              width: double.infinity,
              child: Text(
                _showAnswer ? card.answer : card.question,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _nextCard,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}