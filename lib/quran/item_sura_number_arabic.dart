import 'package:flutter/material.dart';

class ItemSuraNumberArabic extends StatelessWidget {
  String number;

  ItemSuraNumberArabic({required this.number});

  @override
  Widget build(BuildContext context) {
    return Text(
      number,
      style: Theme.of(context).textTheme.bodySmall,
      textAlign: TextAlign.center,
    );
  }
}
