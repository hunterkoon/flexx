import 'dart:convert';

import 'package:flexx/http/HttpRequests.dart';
import 'package:flexx/models/ErrorDTO.dart';
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
    int statusCode = 200;
    String? errorMessage = '';
    ErrorDTO error;

    return ElevatedButton(
      style: styleButton(),
      onPressed: () {
        UserDTO user =
            UserDTO(nomeCompleto.text, documento.text, 'CPF', senha.text);
        debugPrint('${user.toJson()}');

        Future<http.Response> createUserRequest = HttpRequests.requestHttpPost(
            'http://192.168.1.23:8081/api/v1/flexx/user/register',
            jsonEncode(user.toJson()), {});

        createUserRequest.then((response) {
          if (response.statusCode != 200) {
            error = ErrorDTO.fromJson(jsonDecode(response.body));
            statusCode = response.statusCode;
            try {
              errorMessage = utf8.decode(error.message.runes.toList(), allowMalformed: false);
            } catch (e) {
              errorMessage = error.message;
            }
            debugPrint(errorMessage);
          }

          // TODO IMPLEMENTAR LOADING
          // TODO IMPLEMENTAR MODAL DE SUCESSO
        }).then((retur) {
          if (statusCode != 200) {
            debugPrint('My StatusCode: $statusCode');
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return ModalAlertError(errorMessage!);
              },
            );
          }
        });

        FocusScope.of(context).unfocus();
      },
      child: const Text('Cadastrar'),
    );
  }
}

class ModalAlertError extends StatelessWidget {
  final String? errorMessage;

  const ModalAlertError(String this.errorMessage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(3),
              child: Text('Ocorreu um erro: ${errorMessage!}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: styleButton(),
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//TODO CRIAR PACOTE DE ESTILOS
ButtonStyle styleButton() {
  return ElevatedButton.styleFrom(
    fixedSize: const Size(180.0, 45.0),
    foregroundColor: Colors.white,
    backgroundColor: Colors.red,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    textStyle: const TextStyle(
      fontSize: 18,
    ),
  );
}
