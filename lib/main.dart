import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            style: TextStyle(color: Colors.white),
            "Flexx - Entregas Rápidas",
            textDirection: TextDirection.ltr,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Clicou");
          },
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

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        EntregaValor('Entrega 1', '1'),
      ],
    );
  }
}

class EntregaValor extends StatelessWidget {
  final String entrega;
  final String valor;

  const EntregaValor(this.entrega, this.valor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: ListTile(
        title: Text(
          entrega,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        leading: const Icon(
          Icons.monetization_on,
        ),
        subtitle: Text('R\$$valor'),
      ),
    );
  }
}
