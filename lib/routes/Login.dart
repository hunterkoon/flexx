import 'package:flutter/material.dart';
import '../forms/Forms.dart';
import '../forms/ActionButtons.dart';
import '../main.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController documentCtrl = TextEditingController();
    final TextEditingController passwordCtlr = TextEditingController();

    return Scaffold(
      body: Column(children: [
        Editor.texto(
          'CPF/CNPJ',
          '12345678912',
          documentCtrl,
          Icons.account_circle,
        ),
        Editor.senha(
          'Senha',
          '#####',
          passwordCtlr,
          Icons.password,
        ),
        ActionButtonEntrarWidget(documentCtrl: documentCtrl, passwordCtlr: passwordCtlr),
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.grey),
          onPressed: () {
            Future<ListaTransferencias?> future = Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return FormularioCadastro();
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


