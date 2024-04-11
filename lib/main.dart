import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: const Column(
          children: [
            Card(
              color: Colors.grey,
              child: ListTile(
                title: Text(
                  "Entrega 1",
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(Icons.monetization_on),
              ),
            ),
            Card(
              color: Colors.grey,
              child: ListTile(
                title: Text(
                  "Entrega 2",
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(Icons.monetization_on),
              ),
            ),
          ],
        ),
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
        ),
      ),
    ),
  );
}
