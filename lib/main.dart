import 'package:flutter/material.dart';
import 'package:pocblah/models/fruit.dart';
import 'package:pocblah/services/api.dart';

import 'components/fruit_item.dart';
import 'components/fruit_list.dart';

void main() {
  runApp(MyApp());
}

class FruitContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FruitContainerState();
  }
}

class FruitContainerState extends State<FruitContainer> {
  Future<List<Fruit>>? fruitListFuture;

  @override
  void initState() {
    super.initState();
    fruitListFuture = getFruitList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Fruit>>(
      future: fruitListFuture,
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          Iterable<FruitItem> iFruits =
              snapshot.data!.map((fruit) => FruitItem(name: fruit.name));

          return Center(
            child: FruitList(
              children: List<FruitItem>.from(iFruits),
            ),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Erro: ${snapshot.error}"),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text("App"),
            ),
          ),
          body: FruitContainer()),
    );
  }
}
