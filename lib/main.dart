import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text(
              style: TextStyle(color: Colors.white),
              "Flexx - Entregas Rápidas",
              textDirection: TextDirection.ltr,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.red,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )),
    ),
  );
}
