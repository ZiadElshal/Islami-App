import 'package:flutter/material.dart';

class ItemHadithDetails extends StatelessWidget {
  String content;

  ItemHadithDetails({required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: TextAlign.right,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
