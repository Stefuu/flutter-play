import 'package:pocblah/models/fruit.dart';
import 'package:pocblah/services/api.dart' as api;

class FruitBloc {
  Future<List<Fruit>>? fruitListFuture;

  void getFruitList() {
    this.fruitListFuture = api.getFruitList();
  }
}
