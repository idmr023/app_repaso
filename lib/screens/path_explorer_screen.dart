import 'package:flutter/material.dart';

class PathExplorerScreen extends StatefulWidget {
  const PathExplorerScreen({Key? key}) : super(key: key);

  @override
  State<PathExplorerScreen> createState() => _PathExplorerScreenState();
}

class _PathExplorerScreenState extends State<PathExplorerScreen> {
  static const int gridSize = 5;
  List<List<bool>> pathGrid = List.generate(5, (_) => List.filled(5, false));
  List<Offset> correctPath = [
    Offset(0, 0),
    Offset(1, 0),
    Offset(2, 0),
    Offset(2, 1),
    Offset(2, 2),
  ];

  bool showPath = true;
  List<Offset> userPath = [];

  @override
  void initState() {
    super.initState();
    _showPathTemporarily();
  }

  void _showPathTemporarily() async {
    for (var pos in correctPath) {
      pathGrid[pos.dy.toInt()][pos.dx.toInt()] = true;
    }

    setState(() {
      showPath = true;
    });

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      showPath = false;
    });
  }

  void _onCellTapped(int row, int col) {
    final tapped = Offset(col.toDouble(), row.toDouble());

    setState(() {
      userPath.add(tapped);
    });

    final expected = correctPath[userPath.length - 1];

    if (tapped != expected) {
      _showResultDialog("¡Error!", "Te equivocaste. Intenta de nuevo.");
      userPath.clear();
    } else if (userPath.length == correctPath.length) {
      _showResultDialog("¡Bien hecho!", "Has completado el camino.");
    }
  }

  void _showResultDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                userPath.clear();
              });
            },
            child: const Text("Reintentar"),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid() {
    return Column(
      children: List.generate(gridSize, (row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(gridSize, (col) {
            bool isInPath = pathGrid[row][col];
            bool isTapped = userPath.contains(
              Offset(col.toDouble(), row.toDouble()),
            );
            return GestureDetector(
              onTap: () => _onCellTapped(row, col),
              child: Container(
                margin: const EdgeInsets.all(4),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: showPath
                      ? (isInPath ? Colors.blueAccent : Colors.grey[300])
                      : (isTapped ? Colors.green : Colors.grey[300]),
                  border: Border.all(color: Colors.black),
                ),
              ),
            );
          }),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Explora el Camino")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Recuerda el camino que se mostrará brevemente.\n¡Tócalo en el orden correcto para llegar al final!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(child: Center(child: _buildGrid())),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  userPath.clear();
                  _showPathTemporarily();
                });
              },
              child: const Text("Reiniciar"),
            ),
          ],
        ),
      ),
    );
  }
}
