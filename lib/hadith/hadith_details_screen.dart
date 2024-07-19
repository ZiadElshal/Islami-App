import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/hadith/hadith.dart';
import 'package:islami_app/hadith/item_hadith_details.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadithDetailsScreen extends StatefulWidget {
  static const String routeName = "hadith_details_screen";

  @override
  State<HadithDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<HadithDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadith;

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
                args.title,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: provider.appTheme == ThemeMode.light
                          ? AppColors.blackColor
                          : AppColors.whiteColor,
                    ),
                textAlign: TextAlign.center,
              ),
              Divider(
                color: provider.appTheme == ThemeMode.light
                    ? AppColors.primaryLightColor
                    : AppColors.whiteColor,
                thickness: 2,
                indent: 30,
                endIndent: 30,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Expanded(
                child: ListView.builder(
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
