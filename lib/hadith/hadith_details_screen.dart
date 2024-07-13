import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/hadith/hadith.dart';
import 'package:islami_app/hadith/item_hadith_details.dart';

class HadithDetailsScreen extends StatefulWidget {
  static const String routeName = "hadith_details_screen";

  @override
  State<HadithDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<HadithDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadith;

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
                args.title,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              Divider(
                color: AppColors.primaryLightColor,
                thickness: 2,
                indent: 30,
                endIndent: 30,
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  // separatorBuilder: (context, index) {
                  //   return Divider(
                  //     color: AppColors.primaryLightColor,
                  //     thickness: 2,
                  //   );
                  // },
                  itemBuilder: (context, index) {
                    return ItemHadithDetails(content: args.content[index]);
                  },
                  itemCount: args.content.length,
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
