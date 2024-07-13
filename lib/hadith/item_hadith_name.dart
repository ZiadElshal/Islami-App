import 'package:flutter/material.dart';
import 'package:islami_app/hadith/hadith.dart';
import 'package:islami_app/hadith/hadith_details_screen.dart';

class ItemHadithName extends StatelessWidget {
  Hadith hadith;

  ItemHadithName({required this.hadith});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadithDetailsScreen.routeName, arguments: hadith);
      },
      child: Text(
        hadith.title,
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
