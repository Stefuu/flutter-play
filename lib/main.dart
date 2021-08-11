import 'package:flutter/material.dart';
import 'package:pocblah/blocs/fruit.dart';
import 'package:pocblah/models/fruit.dart';
import 'package:provider/provider.dart';

import 'components/fruit_item.dart';
import 'components/fruit_list.dart';

void main() {
  runApp(ChangeNotifierProvider<FruitBloc>(
      create: (_) => FruitBloc(), child: MyApp()));
}

class FruitStreamContainer extends StatelessWidget {
  const FruitStreamContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FruitBloc>(
      builder: (context, bloc, _) {
        return StreamBuilder<List<Fruit>>(
          stream: bloc.fruitStream,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              Iterable<FruitItem> iFruits =
                  snapshot.data!.map((fruit) => FruitItem(name: fruit.name));

              return Center(
                child: Column(
                  children: [
                    FruitList(
                      children: List<FruitItem>.from(iFruits),
                    ),
                    ElevatedButton(
                        onPressed: () => bloc.getFruitWithStream(),
                        child: Text("Carrega ae")),
                    ElevatedButton(
                        onPressed: () => bloc.loadSecondList(),
                        child: Text("Carrega ae de novo")),
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Erro: ${snapshot.error}"),
              );
            } else {
              return Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    ElevatedButton(
                        onPressed: () => bloc.getFruitWithStream(),
                        child: Text("Carrega ae")),
                    ElevatedButton(
                        onPressed: () => bloc.loadSecondList(),
                        child: Text("Carrega ae de novo")),
                  ],
                ),
              );
            }
          },
        );
      },
    );
  }
}

class StatelessFruitContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FruitBloc>(
        builder: (ctx, bloc, _) => FutureBuilder<List<Fruit>>(
              future: bloc.fruitListFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  Iterable<FruitItem> iFruits = snapshot.data!
                      .map((fruit) => FruitItem(name: fruit.name));

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
                      child: Column(children: [
                    CircularProgressIndicator(),
                    ElevatedButton(
                        onPressed: () => bloc.getFruitList(),
                        child: Text("Carrega ae")),
                  ]));
                }
              },
            ));
  }
}

class StatefulFruitContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StatefulFruitContainerState();
  }
}

class StatefulFruitContainerState extends State<StatefulFruitContainer> {
  FruitBloc? bloc;

  @override
  void initState() {
    super.initState();
    bloc = FruitBloc();
    // bloc!.getFruitList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Fruit>>(
      future: bloc!.fruitListFuture,
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
              child: Column(children: [
            CircularProgressIndicator(),
            ElevatedButton(
                onPressed: () => this.bloc!.getFruitList(),
                child: Text("Carrega ae")),
          ]));
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
          body: FruitStreamContainer()),
    );
  }
}
