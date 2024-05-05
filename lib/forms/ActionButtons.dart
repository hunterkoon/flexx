import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class ActionButtonEntrarWidget extends StatelessWidget {
  const ActionButtonEntrarWidget({
    super.key,
    required this.documentCtrl,
    required this.passwordCtlr,
  });

  final TextEditingController documentCtrl;
  final TextEditingController passwordCtlr;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(180.0, 45.0),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: const TextStyle(
          fontSize: 18,
        ),
      ),
      onPressed: () {
        debugPrint('Entrar ${documentCtrl.value.text} | ${passwordCtlr.value.text}' );
        FocusScope.of(context).unfocus();
      },
      child: const Text('Entrar'),
    );
  }
}

class ActionButtonCadastrarWidget extends StatelessWidget {


  final TextEditingController documento ;
  final TextEditingController senha;
  final TextEditingController nomeCompleto;
  final TextEditingController email;
  final TextEditingController tipoDocumento;
  final TextEditingController numeroCelular;

  const ActionButtonCadastrarWidget({super.key, required this.documento, required this.senha, required this.nomeCompleto, required this.email, required this.tipoDocumento, required this.numeroCelular});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(180.0, 45.0),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: const TextStyle(
          fontSize: 18,
        ),
      ),
      onPressed: () {
        //TODO converter em JSON e chamar API de Cadastro
        FocusScope.of(context).unfocus();
      },
      child: const Text('Cadastrar'),
    );
  }
}