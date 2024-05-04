import 'package:flutter/material.dart';
import '../forms/Forms.dart';
import '../main.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController documentCtrl = TextEditingController();
    final TextEditingController passwordCtlr = TextEditingController();

    return Scaffold(
      body: Column(children: [
        Editor(
          'CPF/CNPJ',
          '12345678912',
          documentCtrl,
          null,
          false
        ),
        Editor(
          'Senha',
          '#####',
          passwordCtlr,
          null,
          true
        ),
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
          onPressed: () {},
          child: const Text('Entrar'),
        ),
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.grey),
          onPressed: () {
            Future<ListaTransferencias?> future = Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                //TODO CRIAR FORMULÁRIO DE REGISTRO
                return FormularioTransferencia();
              }),
            );
            debugPrint('Primeiro Acesso');
          },
          child: Text('Primeiro Acesso'),
        )
      ]),
    );
  }
}
