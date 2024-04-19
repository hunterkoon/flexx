import 'package:flutter/cupertino.dart';
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
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  static bool stateOfAlert = false;

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de transferências!'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              controller: _controladorCampoNumeroConta,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              decoration: const InputDecoration(
                  labelText: 'Número da conta', hintText: '0000'),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              controller: _controladorCampoValor,
              decoration: const InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Valor da transferência',
                  hintText: '100.00 R\$'),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              debugPrint(_controladorCampoNumeroConta.text);
              debugPrint(_controladorCampoValor.text);

              final int? numeroConta =
                  int.tryParse(_controladorCampoNumeroConta.text);
              final int? valorTransf =
                  int.tryParse(_controladorCampoValor.text);

              try {
                numeroConta != null && valorTransf != null
                    ? Transferencia(numeroConta, valorTransf)
                    : throw Exception("Valores de referência invalidos");
              } on Exception catch (e) {
                debugPrint(e.toString());
                FormularioTransferencia.stateOfAlert = true;
              }
            },
            child: const Text('Adicionar'),
          ),
          //const Aviso(),
        ],
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
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          style: TextStyle(color: Colors.white),
          "Flexx - numeroContas Rápidas",
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

class Transferencia extends StatelessWidget {
  final int? numeroConta;
  final int? valor;

  const Transferencia(this.numeroConta, this.valor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: ListTile(
        title: Text(
          numeroConta.toString(),
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
