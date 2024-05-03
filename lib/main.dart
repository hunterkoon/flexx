import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'forms/Forms.dart';

void main() {
  runApp(const FlexxApp());
}

class FlexxApp extends StatelessWidget {
  const FlexxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
      ),
    );
  }
}

class Aviso extends StatelessWidget {
  const Aviso({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Aviso!!!');
    return const Padding(
      padding: EdgeInsets.all(1.0),
      child: CupertinoAlertDialog(
        title: Text(
          'Ocorreu um erro!',
          style: TextStyle(fontSize: 16),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(child: Text("OK"))
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
          Transferencia(100, 100),
          Transferencia(100, 100),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          style: TextStyle(color: Colors.white),
          "Flexx - Encomendas Rápidas",
          textDirection: TextDirection.ltr,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Future<Transferencia?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            if (transferenciaRecebida != null) {
              if (transferenciaRecebida.numeroConta != null) {
                debugPrint('Valores recebidos do then');
              }
            }
          });
        },
      ),
    );
  }
}
