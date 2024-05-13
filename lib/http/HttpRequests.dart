import 'dart:convert';

import 'package:flexx/models/ErrorDTO.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpRequests {
  static Future<http.Response> requestHttpPost(
      String url, String json, Map<String, String> headers) async {
    Map<String, String> headersDefault = {
      'Content-Type': 'application/json ; charset=UTF-8'
    };
    try {
      final http.Response response;

      headersDefault.addAll(headers);
      response = await http.post(
        Uri.parse(url),
        headers: headersDefault,
        body: json,
      );

      return response;
      /*
        TODO MELHORAR IMPLEMENTAÇÃO DE ERROR
         CRIAR CAMADA QUE ABSTRAI OBJETOS
       */
    } on Exception catch (e) {
      debugPrint('Some error was occurred : ' '$e');
      if (e is http.ClientException) {
        String message =
            'Não foi possível se comunicar com o servidor, por favor tente novamente mais tarde!';
        ErrorDTO error = ErrorDTO('INTERNAL_SERVER_ERROR', message, null);
        return Future(() => http.Response(jsonEncode(error.toJson()), 500,
            headers: headersDefault));
      }
      rethrow;
    }
  }
}
