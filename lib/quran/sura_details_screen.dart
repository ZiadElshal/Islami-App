import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/quran/item_sura_details.dart';
import 'package:islami_app/quran/sura_details_arguments.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "sura_details_screen";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArguments;
    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return Stack(children: [
      provider.appTheme == ThemeMode.light
          ? Image.asset(
              "assets/images/background_screen_light.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            )
          : Image.asset(
              "assets/images/background_screen_dark.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.app_title,
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
            color: provider.appTheme == ThemeMode.light
                ? AppColors.whiteColor
                : AppColors.primaryDarkColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Text(
                provider.appLanguage == "ar"
                    ? "سورة ${args.name}"
                    : "${args.name}",
                style: provider.appTheme == ThemeMode.light
                    ? Theme.of(context).textTheme.bodySmall
                    : Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.whiteColor,
                        ),
                textAlign: TextAlign.center,
              ),
              Divider(
                color: provider.appTheme == ThemeMode.light
                    ? AppColors.primaryLightColor
                    : AppColors.whiteColor,
                thickness: 2,
                indent: 60,
                endIndent: 60,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              verses.isEmpty
                  ? CircularProgressIndicator(
                      color: AppColors.primaryLightColor,
                    )
                  : Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: provider.appTheme == ThemeMode.light
                                ? AppColors.primaryLightColor
                                : AppColors.whiteColor,
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
