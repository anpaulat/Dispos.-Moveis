import 'package:flutter_trab_1/models/pizzas.dart';

class PizzasRepository {
  static List<Pizza> tabela = [
    Pizza(
        icone: 'images/Abacaxi.jpg',
        nome: 'Havaina',
        desc:
            'Pizza havaiana que contém: Queijo mussarela, presunto, molho de tomate e abacaxi.',
        preco: 32.99),
    Pizza(
        icone: 'images/Camarao.png',
        nome: 'Camarão',
        desc:
            'Pizza de camarão que contém: Queijo mussarela, molho de tomate, camarão e ervas.',
        preco: 34.99),
    Pizza(
        icone: 'images/Queijo.jpg',
        nome: 'Queijo',
        desc:
            'Pizza de queijo que contém: Queijo mussarela, queijo parmesão e molho de tomate.',
        preco: 24.99),
    Pizza(
        icone: 'images/Brocolis.jpg',
        nome: 'Brócolis',
        desc:
            'Pizza de brócolis que contém: Queijo mussarela, presunto, molho de tomate e brócolis.',
        preco: 27.99),
    Pizza(
        icone: 'images/Azeitona.jpg',
        nome: 'Bacon',
        desc:
            'Pizza de bacon que contém: Queijo mussarela, bacon, vagem, champignon e azeitonas pretas.',
        preco: 29.99),
  ];
}
