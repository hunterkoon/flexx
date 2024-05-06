import 'package:flutter/material.dart';

import 'forms/Forms.dart';
import 'routes/Login.dart';

void main() {
  runApp(const FlexxApp());
}

class FlexxApp extends StatelessWidget {
  const FlexxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Login(),
        appBar:  AppBarWidget(),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget implements PreferredSize {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
      title: const Text(
        style: TextStyle(color: Colors.white),
        "Flexx - Encomendas Rápidas",
        textDirection: TextDirection.ltr,
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize  => const Size.fromHeight(60);
}

class ListaTransferencias extends StatefulWidget {
  List<Transferencia?> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTranferenciasState();
  }
}

class ListaTranferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, idx) {
          final transferencia = widget._transferencias[idx];
          return Transferencia(
              transferencia?.numeroConta, transferencia?.valor);
        },
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
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Future<Transferencia?> future = Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            }),
          );
          future.then((transferenciaRecebida) {
            setState(() {
              if(transferenciaRecebida != null ){
              widget._transferencias.add(transferenciaRecebida);
              }
            });
          });
        },
      ),
    );
  }
}
