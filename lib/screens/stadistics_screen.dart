import 'package:app_repaso/models/StudyStats.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {
  final StudyStats stats;

  const StatisticsScreen({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estadísticas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tarjetas repasadas: ${stats.cardsReviewed}'),
            const SizedBox(height: 10),
            Text('Tiempo total de estudio: ${stats.totalStudyTime.inMinutes} minutos'),
            const SizedBox(height: 10),
            Text('Preguntas correctas: ${stats.totalCorrect} / ${stats.totalQuestions}'),
            const SizedBox(height: 10),
            Text('Precisión: ${stats.accuracy.toStringAsFixed(1)}%'),
          ],
        ),
      ),
    );
  }
}
