import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final String? title;
  final String? tip;
  final TextEditingController? controller;
  final IconData? icon;
  final bool isPassword;

  const Editor(this.title, this.tip, this.controller, this.icon, this.isPassword, {super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: TextField(
        obscureText: isPassword,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor("Número da Conta", "0000", _controladorNumeroConta,
                Icons.numbers,false),
            Editor("Valor da Transferência", "R\$ 200.00", _controladorValor,
                Icons.monetization_on,false),
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
                    Transferencia transferenciaCriada =
                    Transferencia(numeroConta, valorTransf);
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
