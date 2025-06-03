import 'package:app_repaso/screens/importador.dart';
import 'package:app_repaso/screens/webview_screen.dart';
import 'package:flutter/material.dart';
import '../models/flashcard.dart';
import 'create_card_screen.dart';
import 'study_screen.dart';

class HomeScreen extends StatefulWidget {
  final List<Flashcard> flashcards;

  const HomeScreen({super.key, required this.flashcards});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _addFlashcard(Flashcard card) {
    setState(() {
      widget.flashcards.add(card);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis Flashcards')),
      body: ListView.builder(
        itemCount: widget.flashcards.length,
        itemBuilder: (context, index) {
          final card = widget.flashcards[index];
          return ListTile(
            title: Text(card.question),
            subtitle: Text(card.answer),
          );
        },
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
            leading: const Icon(Icons.flash_on),
            title: const Text('Repasar con Flashcards'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ImportadorDeTarjetas(), // <-- aquí
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
                  builder: (_) => const WebViewScreen(),
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
        ],
      ),
    );
  }
}
