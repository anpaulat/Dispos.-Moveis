// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trab_1/models/pizzas.dart';
import 'package:flutter_trab_1/repositories/carrinho_repository.dart';
import 'package:flutter_trab_1/widgets/carrinho_card.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Carrinho extends StatefulWidget {
  Carrinho({
    Key? key,
  }) : super(key: key);

  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  comprar() {
    Navigator.pop(context);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Item adicionado ao carrinho!')));
  }

  @override
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: "R\$");

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Container(
        child:
            Consumer<CarrinhoRepository>(builder: (context, carrinho, child) {
          return carrinho.lista.isEmpty
              ? ListTile(
                  leading: Icon(Icons.add_shopping_cart),
                  title: Text('O carrinho está vazio.'),
                )
              : ListView.builder(
                  itemCount: carrinho.lista.length,
                  itemBuilder: (_, index) {
                    return CarrinhoCard(pizza: carrinho.lista[index]);
                  },
                );
        }),
      ),
    );
  }
}
