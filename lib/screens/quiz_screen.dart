// Archivo: quiz_screen.dart
import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class QuizScreen extends StatefulWidget {
  final List<Flashcard> flashcards;

  const QuizScreen({super.key, required this.flashcards});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int score = 0;
  List<String> options = [];
  String selectedOption = '';

  @override
  void initState() {
    super.initState();
    _generateOptions();
  }

  void _generateOptions() {
    final correctAnswer = widget.flashcards[currentIndex].answer;
    final allAnswers = widget.flashcards.map((e) => e.answer).toList();
    allAnswers.remove(correctAnswer);
    allAnswers.shuffle();
    options = allAnswers.take(3).toList()..add(correctAnswer);
    options.shuffle();
  }

  void _checkAnswer(String answer) {
    setState(() {
      selectedOption = answer;
      if (answer == widget.flashcards[currentIndex].answer) {
        score++;
      }
    });
  }

  void _nextQuestion() {
    if (currentIndex < widget.flashcards.length - 1) {
      setState(() {
        currentIndex++;
        selectedOption = '';
        _generateOptions();
      });
    } else {
      _showFinalScore();
    }
  }

  void _showFinalScore() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Fin del Quiz'),
        content: Text('Puntaje: $score / ${widget.flashcards.length}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    ).then((_) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    final card = widget.flashcards[currentIndex];
    return Scaffold(
      appBar: AppBar(title: const Text('Modo Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pregunta ${currentIndex + 1} de ${widget.flashcards.length}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Text(card.question, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ...options.map((opt) => ListTile(
                  title: Text(opt),
                  tileColor: selectedOption.isEmpty
                      ? null
                      : opt == card.answer
                          ? Colors.green.shade100
                          : opt == selectedOption
                              ? Colors.red.shade100
                              : null,
                  onTap: selectedOption.isEmpty ? () => _checkAnswer(opt) : null,
                )),
            const SizedBox(height: 20),
            if (selectedOption.isNotEmpty)
              ElevatedButton(
                onPressed: _nextQuestion,
                child: const Text('Siguiente'),
              ),
          ],
        ),
      ),
    );
  }
}