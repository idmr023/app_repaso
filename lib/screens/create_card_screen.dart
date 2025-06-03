import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class CreateCardScreen extends StatefulWidget {
  const CreateCardScreen({super.key});

  @override
  State<CreateCardScreen> createState() => _CreateCardScreenState();
}

class _CreateCardScreenState extends State<CreateCardScreen> {
  final _questionsController = TextEditingController();
  final _answersController = TextEditingController();

  void _saveCards() {
    final questionsRaw = _questionsController.text;
    final answersRaw = _answersController.text;

    final questions = questionsRaw.split(',').map((q) => q.trim()).toList();
    final answers = answersRaw.split(';').map((a) => a.trim()).toList();

    if (questions.length != answers.length) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('El número de preguntas no coincide con el de respuestas'),
        ),
      );
      return;
    }

    List<Flashcard> flashcards = [];
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].isNotEmpty && answers[i].isNotEmpty) {
        flashcards.add(Flashcard(question: questions[i], answer: answers[i]));
      }
    }

    Navigator.pop(context, flashcards); // Retornamos una lista
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Varias Tarjetas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _questionsController,
              decoration: const InputDecoration(
                labelText: 'Preguntas (separadas por coma)',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _answersController,
              decoration: const InputDecoration(
                labelText: 'Respuestas (separadas por punto y coma)',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveCards,
              child: const Text('Guardar Tarjetas'),
            ),
          ],
        ),
      ),
    );
  }
}