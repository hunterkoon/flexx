import 'package:flutter/material.dart';

void main() {
  runApp(const FlexxApp());
}

class FlexxApp extends StatelessWidget {
  const FlexxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de transferências!'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: TextField(
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              decoration: InputDecoration(
                  labelText: 'Número da conta', hintText: '0000'),
              keyboardType: TextInputType.number,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: TextField(
              decoration:
                  InputDecoration(
                      icon: Icon(Icons.monetization_on),
                      labelText: 'Valor', hintText: '100.00R\$'),
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Adicionar'))
        ],
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        children: <Widget>[
          EntregaValor("100", "100"),
          EntregaValor("100", "100"),
          EntregaValor("100", "100"),
          EntregaValor("100", "100"),
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
        child: const Icon(Icons.add),
      ),
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
