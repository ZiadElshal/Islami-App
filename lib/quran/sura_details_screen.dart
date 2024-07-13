import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/quran/item_sura_details.dart';
import 'package:islami_app/quran/sura_details_arguments.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "sura_details_screen";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArguments;
    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return Stack(children: [
      Image.asset(
        "assets/images/background_screen.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "إسلامي",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.06,
            vertical: MediaQuery.of(context).size.height * 0.08,
          ),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Text(
                "سورة ${args.name}",
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              Divider(
                color: AppColors.primaryLightColor,
                thickness: 2,
                indent: 60,
                endIndent: 60,
              ),
              SizedBox(
                height: 20,
              ),
              verses.isEmpty
                  ? CircularProgressIndicator(
                      color: AppColors.primaryLightColor,
                    )
                  : Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: AppColors.primaryLightColor,
                            thickness: 2,
                          );
                        },
                        itemBuilder: (context, index) {
                          return ItemSuraDetails(
                            content: verses[index],
                            index: index,
                          );
                        },
                        itemCount: verses.length,
                      ),
                    ),
            ],
          ),
        ),
      ),
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = content.split("\n");
    verses = lines;
    setState(() {});
  }
}
