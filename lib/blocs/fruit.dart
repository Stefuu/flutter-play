import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pocblah/models/fruit.dart';
import 'package:pocblah/services/api.dart' as api;

class FruitBloc extends ChangeNotifier {
  Future<List<Fruit>>? fruitListFuture;
  StreamController<List<Fruit>> _streamController =
      StreamController<List<Fruit>>();
  Stream<List<Fruit>>? fruitStream;

  FruitBloc() {
    this.fruitStream = _streamController.stream;
  }

  void loadSecondList() {
    List<Fruit> fruits = [];

    Fruit apple = Fruit(
      name: 'Maça',
      id: 99,
      nutritions: Nutritions(),
    );
    fruits.add(apple);
    _streamController.sink.add(fruits);
  }

  void getFruitWithStream() async {
    List<Fruit> fruits = await api.getFruitList();
    _streamController.sink.add(fruits);
  }

  void getFruitList() {
    this.fruitListFuture = api.getFruitList();
    notifyListeners();
  }
}
