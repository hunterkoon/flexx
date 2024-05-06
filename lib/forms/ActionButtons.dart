import 'dart:convert';

import 'package:flexx/models/UserDTO.dart';
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
        debugPrint(
            'Entrar ${documentCtrl.value.text} | ${passwordCtlr.value.text}');

        FocusScope.of(context).unfocus();
      },
      child: const Text('Entrar'),
    );
  }
}

class ActionButtonCadastrarWidget extends StatelessWidget {
  final TextEditingController documento;

  final TextEditingController senha;
  final TextEditingController nomeCompleto;
  final TextEditingController email;
  final TextEditingController tipoDocumento;
  final TextEditingController numeroCelular;

  const ActionButtonCadastrarWidget(
      {super.key,
      required this.documento,
      required this.senha,
      required this.nomeCompleto,
      required this.email,
      required this.tipoDocumento,
      required this.numeroCelular});

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
        UserDTO user =
            UserDTO(nomeCompleto.text, documento.text, 'CPF', senha.text);
        debugPrint('${user.toJson()}');

        Future<http.Response?> fetchRegister() async {
          final http.Response response;

          try {
            response = await http.post(
              Uri.parse('http://192.168.1.23:8081/api/v1/flexx/user/register'),
              headers: <String, String>{
                'Content-Type': 'application/json ; charset=UTF-8'
              },
              body: jsonEncode(user.toJson()),
            );
            return response;
          } finally {}
        }

        fetchRegister.call().then((value) => debugPrint(value?.body));

        FocusScope.of(context).unfocus();
      },
      child: const Text('Cadastrar'),
    );
  }
}
