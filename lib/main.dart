import 'package:flutter/material.dart';

import 'routes/Login.dart';

void main() {
  runApp(const FlexxApp());
}

class FlexxApp extends StatelessWidget {
  const FlexxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexx',
      home: Scaffold(
        //TODO IMPLEMENTAR IMAGEM DE LOGOTIPO
        body: Login(),
        //appBar:  AppBarWidget(),
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
        "Flexx",
        textDirection: TextDirection.ltr,
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize  => const Size.fromHeight(60);
}
