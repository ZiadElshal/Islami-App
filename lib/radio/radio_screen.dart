import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class RadioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.15,
      ),
      child: Column(
        children: [
          Image.asset("assets/images/radio_logo.png"),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.03,
            ),
            child: Text(
              AppLocalizations.of(context)!.quran_radio,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.first_page_rounded,
                    color: provider.appTheme == ThemeMode.light
                        ? AppColors.primaryMoreLightColor
                        : AppColors.yellowColor,
                    size: 40,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: provider.appTheme == ThemeMode.light
                        ? AppColors.primaryMoreLightColor
                        : AppColors.yellowColor,
                    size: 40,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.last_page_rounded,
                    color: provider.appTheme == ThemeMode.light
                        ? AppColors.primaryMoreLightColor
                        : AppColors.yellowColor,
                    size: 40,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
