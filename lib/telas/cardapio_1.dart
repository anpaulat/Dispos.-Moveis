import 'dart:ui';
import 'package:flutter_trab_1/models/pizzas.dart';
import 'package:flutter_trab_1/repositories/carrinho_repository.dart';
import 'package:flutter_trab_1/telas/carrinho.dart';
import 'package:flutter_trab_1/telas/pizzas_detalhes.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trab_1/repositories/pizzas_repository.dart';

class Cardapio extends StatefulWidget {
  const Cardapio({Key? key}) : super(key: key);

  @override
  State<Cardapio> createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {
  @override
  Widget build(BuildContext context) {
    late CarrinhoRepository Carrinho;
    final tabela = PizzasRepository.tabela;
    NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: "R\$");
    List<Pizza> selecionada = [];
    Carrinho = Provider.of<CarrinhoRepository>(context);

    return Scaffold(
        appBar: AppBar(title: Text('Cardapio')),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int Pizzas) {
            return ListTile(
              leading: Image.asset(tabela[Pizzas].icone),
              title: Text(
                tabela[Pizzas].nome,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                tabela[Pizzas].desc,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              trailing: Text(real.format(tabela[Pizzas].preco)),
              selected: selecionada.contains(tabela[Pizzas]),
              selectedTileColor: Colors.indigo[50],
              onLongPress: () {
                setState(() {
                  (selecionada.contains(tabela[Pizzas]))
                      ? selecionada.remove(tabela[Pizzas])
                      : selecionada.add(tabela[Pizzas]);
                });
              },
              onTap: () => mostrarDetalhes(tabela[Pizzas]),
            );
          },
          padding: EdgeInsets.all(16),
          separatorBuilder: (_, ___) => Divider(),
          itemCount: tabela.length,
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () => mostrarCarrinho(),
            icon: Icon(Icons.shopping_cart),
            label: Text('CARRINHO')));
  }

  mostrarDetalhes(Pizza tabela) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetalhesPizza(pizzas: tabela)),
    );
  }

  mostrarCarrinho() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => Carrinho()),
    );
  }
}
