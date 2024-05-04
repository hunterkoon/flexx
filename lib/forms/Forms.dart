import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final String title;
  final String tip;
  final TextEditingController controller;
  final IconData icon;

  const Editor(
      {super.key,
      required this.title,
      required this.tip,
      required this.controller,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.red,
          ),
          labelText: title,
          hintText: tip,
          floatingLabelStyle: const TextStyle(
              backgroundColor: Colors.black, color: Colors.white),
        ),
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de transferências!'),
      ),
      body: Column(
        children: [
          Editor(
              title: "Número da Conta",
              tip: "0000",
              controller: _controladorNumeroConta,
              icon: Icons.numbers),
          Editor(
              title: "Valor da Transferência",
              tip: "R\$ 200.00",
              controller: _controladorValor,
              icon: Icons.monetization_on),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              textStyle: const TextStyle(
                fontSize: 16,
              ),
            ),
            onPressed: () {
              debugPrint(_controladorNumeroConta.text);
              debugPrint(_controladorValor.text);
              final int? numeroConta =
                  int.tryParse(_controladorNumeroConta.text);
              final int? valorTransf = int.tryParse(_controladorValor.text);
              try {
                if (numeroConta != null && valorTransf != null) {
                  Transferencia transferenciaCriada = Transferencia(numeroConta, valorTransf);
                  Navigator.pop(context, transferenciaCriada);
                } else {
                  throw Exception("Valores de referência invalidos");
                }

              } on Exception catch (e) {
                debugPrint(e.toString());
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

class Transferencia extends StatelessWidget {
  final int? numeroConta;
  final int? valor;

  const Transferencia(this.numeroConta, this.valor);

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
