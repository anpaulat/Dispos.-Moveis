import 'package:flutter_trab_1/models/pizzas.dart';
import 'package:flutter_trab_1/repositories/carrinho_repository.dart';
import 'package:flutter_trab_1/telas/pizzas_detalhes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trab_1/models/pizzas.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CarrinhoCard extends StatefulWidget {
  Pizza pizza;

  CarrinhoCard({Key? key, required this.pizza}) : super(key: key);

  @override
  _CarrinhoCardState createState() => _CarrinhoCardState();
}

class _CarrinhoCardState extends State<CarrinhoCard> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

  static Map<String, Color> precoColor = <String, Color>{
    'up': Colors.teal,
    'down': Colors.indigo,
  };

  abrirDetalhes() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetalhesPizza(pizzas: widget.pizza),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 12),
      elevation: 2,
      child: InkWell(
        onTap: () => abrirDetalhes(),
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
          child: Row(
            children: [
              Image.asset(
                widget.pizza.icone,
                height: 40,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.pizza.nome,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        widget.pizza.desc,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: precoColor['down']!.withOpacity(0.05),
                  border: Border.all(
                    color: precoColor['down']!.withOpacity(0.4),
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  real.format(widget.pizza.preco),
                  style: TextStyle(
                    fontSize: 16,
                    color: precoColor['down'],
                    letterSpacing: -1,
                  ),
                ),
              ),
              PopupMenuButton(
                icon: Icon(Icons.more_vert),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: ListTile(
                      title: Text('Remover do carrinho'),
                      onTap: () {
                        Navigator.pop(context);
                        Provider.of<CarrinhoRepository>(context, listen: false)
                            .remove(widget.pizza);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
