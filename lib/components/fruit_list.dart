import 'package:flutter/widgets.dart';
import 'fruit_item.dart';

class FruitList extends StatelessWidget {
  final List<FruitItem> children;

  const FruitList({
    Key? key,
    List<FruitItem> children = const <FruitItem>[],
  })  : this.children = children,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children,
    );
  }
}
