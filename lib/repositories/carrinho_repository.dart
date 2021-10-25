import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_trab_1/models/pizzas.dart';

class CarrinhoRepository extends ChangeNotifier {
  List<Pizza> _lista = [];

  UnmodifiableListView<Pizza> get lista => UnmodifiableListView(_lista);

  saveAll(List<Pizza> Pizza) {
    Pizza.forEach((Pizza) {
      if (!_lista.contains(Pizza)) _lista.add(Pizza);
    });
    notifyListeners();
  }

  remove(Pizza Pizza) {
    _lista.remove(Pizza);
    notifyListeners();
  }
}
