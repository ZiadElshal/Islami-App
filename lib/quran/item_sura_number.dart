import 'package:flutter/material.dart';

class ItemSuraNumber extends StatelessWidget {
  int number;

  ItemSuraNumber({required this.number});

  @override
  Widget build(BuildContext context) {
    return Text(
      number.toString(),
      style: Theme.of(context).textTheme.bodySmall,
      textAlign: TextAlign.center,
    );
  }
}
