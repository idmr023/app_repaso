import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class EditCardScreen extends StatefulWidget {
  final Flashcard originalCard;

  const EditCardScreen({super.key, required this.originalCard});

  @override
  State<EditCardScreen> createState() => _EditCardScreenState();
}

class _EditCardScreenState extends State<EditCardScreen> {
  late TextEditingController _questionController;
  late TextEditingController _answerController;

  @override
  void initState() {
    super.initState();
    _questionController = TextEditingController(text: widget.originalCard.question);
    _answerController = TextEditingController(text: widget.originalCard.answer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Tarjeta')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _questionController,
              decoration: const InputDecoration(labelText: 'Pregunta'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _answerController,
              decoration: const InputDecoration(labelText: 'Respuesta'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  Flashcard(
                    question: _questionController.text.trim(),
                    answer: _answerController.text.trim(),
                  ),
                );
              },
              child: const Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
}
