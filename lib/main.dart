import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_trab_1/repositories/carrinho_repository.dart';
import 'package:flutter_trab_1/telas/cardapio_1.dart';
import 'package:flutter_trab_1/telas/login_1.dart';
import 'package:provider/provider.dart';
import 'principal_1.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CarrinhoRepository(),
    child: Principal(),
  ));
}
