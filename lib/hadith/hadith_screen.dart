import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/hadith/hadith.dart';
import 'package:islami_app/hadith/item_hadith_name.dart';

class HadithScreen extends StatefulWidget {
  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  List<Hadith> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    loadHadithFile();

    return Column(
      children: [
        Expanded(child: Image.asset("assets/images/hadith_logo.png")),
        Divider(
          color: AppColors.primaryLightColor,
          thickness: 4,
        ),
        Text(
          "الأحاديث",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Divider(
          color: AppColors.primaryLightColor,
          thickness: 4,
        ),
        Expanded(
          flex: 2,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                color: AppColors.primaryLightColor,
                thickness: 2,
              );
            },
            itemBuilder: (context, index) {
              return ItemHadithName(hadith: ahadethList[index]);
            },
            itemCount: ahadethList.length,
          ),
        ),
      ],
    );
  }

  void loadHadithFile() async {
    String hadithContent =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> hadithList = hadithContent.split("#\r\n");
    ahadethList = hadithList.map((hadith) {
      List<String> hadithLines = hadith.split("\n");
      String title = hadithLines.first;
      hadithLines.removeAt(0);
      return Hadith(title: title, content: hadithLines);
    }).toList();

    setState(() {});
  }
}
