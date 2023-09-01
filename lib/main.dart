import 'package:flutter/material.dart';

void main() {
  var app = MaterialApp(
    home: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("ok"),
      ),
      appBar: AppBar(
        title: const Text('Minhas imagens'),
      ),
    ),
  );
  runApp(app);
}
