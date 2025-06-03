import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ImportadorDeTarjetas(),
  ));
}

class ImportadorDeTarjetas extends StatefulWidget {
  @override
  _ImportadorDeTarjetasState createState() => _ImportadorDeTarjetasState();
}

class _ImportadorDeTarjetasState extends State<ImportadorDeTarjetas> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _tarjetas = [];
  String separador = '=>';

  void _procesarTexto() {
    _tarjetas.clear();
    final lineas = _controller.text.trim().split('\n');

    for (final linea in lineas) {
      if (linea.trim().isEmpty) continue;
      final partes = linea.split(separador);
      if (partes.length != 2) continue;

      _tarjetas.add({
        'pregunta': partes[0].trim(),
        'respuesta': partes[1].trim(),
      });
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Importador de tarjetas tipo Quizlet')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Pega aquí tus tarjetas (ej: Hola => Hello)'),
            TextField(
              controller: _controller,
              maxLines: 8,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Text('Separador entre término y definición'),
            TextField(
              onChanged: (value) {
                separador = value;
              },
              decoration: InputDecoration(
                hintText: 'Ej: =>',
              ),
            ),
            ElevatedButton(
              onPressed: _procesarTexto,
              child: Text('Cargar tarjetas'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tarjetas.length,
                itemBuilder: (context, index) {
                  final tarjeta = _tarjetas[index];
                  return ListTile(
                    title: Text(tarjeta['pregunta'] ?? ''),
                    subtitle: Text(tarjeta['respuesta'] ?? ''),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}