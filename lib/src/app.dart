import 'package:flutter/material.dart';

class AppState extends State<App> {
  int numeroImagens = 0;
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Text('$numeroImagens'),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() => numeroImagens++ );
          },
        
          child: const Icon(Icons.add_circle_outline_rounded),
        ),
        appBar: AppBar(
          title: const Text('Minhas imagens'),
        ),
      ),
    );
  }
}

class App extends StatefulWidget {
  State<App> createState() {
    return AppState();
  }
}
