import 'package:flutter/material.dart';
import 'package:pocblah/models/fruit.dart';
import 'package:pocblah/services/api.dart' as api;

class FruitBloc extends ChangeNotifier {
  Future<List<Fruit>>? fruitListFuture;

  void getFruitList() {
    this.fruitListFuture = api.getFruitList();
    notifyListeners();
  }
}
