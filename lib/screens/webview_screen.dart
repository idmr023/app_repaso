// lib/screens/webview_screen.dart
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key});

  Future<String> _loadHtmlFromAssets() async {
    return await rootBundle.loadString('assets/memory_path.html');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loadHtmlFromAssets(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(title: const Text("Camino del Conocimiento")),
            body: WebViewWidget(
              controller: WebViewController()
                ..loadHtmlString(snapshot.data!)
                ..setJavaScriptMode(JavaScriptMode.unrestricted),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}