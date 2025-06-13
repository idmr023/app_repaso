import 'package:app_repaso/models/StudyStats.dart';
import 'package:app_repaso/screens/importador.dart';
import 'package:app_repaso/screens/quiz_screen.dart';
import 'package:app_repaso/screens/stadistics_screen.dart';
import 'package:flutter/material.dart';
import '../models/flashcard.dart';
import 'create_card_screen.dart';
import 'study_screen.dart';
import 'path_explorer_screen.dart';

class HomeScreen extends StatefulWidget {
  final List<Flashcard> flashcards;

  const HomeScreen({super.key, required this.flashcards});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final StudyStats _studyStats = StudyStats();

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';

  void _addFlashcard(Flashcard card) {
    setState(() {
      widget.flashcards.add(card);
    });
  }

  void _deleteFlashcard(int index) {
    setState(() {
      widget.flashcards.removeAt(index);
    });
  }

  void _editFlashcard(int index) async {
    final card = widget.flashcards[index];
    final editedCard = await Navigator.push<Flashcard>(
      context,
      MaterialPageRoute(builder: (_) => CreateCardScreen(editCard: card)),
    );
    if (editedCard != null) {
      setState(() {
        widget.flashcards[index] = editedCard;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredCards = widget.flashcards
        .where(
          (card) =>
              card.question.toLowerCase().contains(
                _searchQuery.toLowerCase(),
              ) ||
              card.answer.toLowerCase().contains(_searchQuery.toLowerCase()),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Mis Flashcards')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.deepPurple.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Bienvenido a tu app de estudio',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 8),
                Text(
                  'Aquí puedes crear, importar y estudiar tarjetas al estilo Quizlet. ¡Conviértete en tu mejor versión!',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCards.length,
              itemBuilder: (context, index) {
                final card = filteredCards[index];
                final originalIndex = widget.flashcards.indexOf(card);
                return Dismissible(
                  key: Key(card.question + card.answer),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (_) => _deleteFlashcard(originalIndex),
                  child: ListTile(
                    title: Text(card.question),
                    subtitle: Text(card.answer),
                    onTap: () => _editFlashcard(originalIndex),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            label: const Text('Estudiar'),
            icon: const Icon(Icons.school),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.quiz),
                        title: Text('Modo Quiz'),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  QuizScreen(flashcards: widget.flashcards),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.map),
                        title: const Text('Explorar el Camino'),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const PathExplorerScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            label: const Text('Importar'),
            icon: const Icon(Icons.upload_file),
            onPressed: () async {
              final importedCards = await Navigator.push<List<Flashcard>>(
                context,
                MaterialPageRoute(builder: (_) => const ImportadorDeTarjetas()),
              );
              if (importedCards != null && importedCards.isNotEmpty) {
                setState(() {
                  widget.flashcards.addAll(importedCards);
                });
              }
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            label: const Text('Agregar'),
            icon: const Icon(Icons.add),
            onPressed: () async {
              final newCards = await Navigator.push<List<Flashcard>>(
                context,
                MaterialPageRoute(builder: (_) => const CreateCardScreen()),
              );
              if (newCards != null && newCards.isNotEmpty) {
                setState(() {
                  widget.flashcards.addAll(newCards);
                });
              }
            },
          ),
          FloatingActionButton.extended(
            label: const Text('Estadísticas'),
            icon: const Icon(Icons.bar_chart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => StatisticsScreen(stats: _studyStats),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
