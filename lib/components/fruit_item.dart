import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FruitItem extends StatelessWidget {
  final String name;

  const FruitItem({
    Key? key,
    String name = '',
  })  : this.name = name,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(this.name),
    );
  }
}
