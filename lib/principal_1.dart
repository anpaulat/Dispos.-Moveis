import 'package:flutter/material.dart';
import 'package:flutter_trab_1/telas/cardapio_1.dart';
import 'package:flutter_trab_1/telas/login_1.dart';

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Login(),
    );
  }
}
