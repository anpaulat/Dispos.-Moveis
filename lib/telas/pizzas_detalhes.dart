// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trab_1/models/pizzas.dart';
import 'package:flutter_trab_1/repositories/carrinho_repository.dart';
import 'package:flutter_trab_1/repositories/pizzas_repository.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetalhesPizza extends StatefulWidget {
  Pizza pizzas;

  DetalhesPizza({Key? key, required this.pizzas}) : super(key: key);
  @override
  State<DetalhesPizza> createState() => _DetalhesPizzaState();
}

class _DetalhesPizzaState extends State<DetalhesPizza> {
  comprar() {
    CarrinhoRepository carrinho;
    Navigator.pop(context);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Item adicionado ao carrinho!')));
  }

  @override
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: "R\$");
  Widget build(BuildContext context) {
    Pizza pizzas;
    late CarrinhoRepository Carrinho;
    Carrinho = Provider.of<CarrinhoRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pizzas.nome),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Image.asset(widget.pizzas.icone),
                width: 500,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                child: Text(
                  real.format(widget.pizzas.preco),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                width: 500,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                child: Text(
                  (widget.pizzas.desc),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),
                width: 500,
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: () {
                comprar();
                Carrinho.saveAll;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_bag),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Comprar',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
