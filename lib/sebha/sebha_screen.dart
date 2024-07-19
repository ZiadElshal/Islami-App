import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SebhaScreen extends StatefulWidget {
  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  double turns = 0;
  int counter = 0;
  int prayerIndex = 0;
  List<String> prayers = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله",
    "استغفر الله",
    "لا حول ولا قوة إلا بالله",
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      child: Center(
        child: Column(
          children: [
            AnimatedRotation(
              turns: turns,
              duration: Duration(seconds: 1),
              child: Stack(
                children: [
                  provider.appTheme == ThemeMode.light
                      ? Image.asset("assets/images/sebha_logo_light.png")
                      : Image.asset("assets/images/sebha_logo_dark.png")
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              AppLocalizations.of(context)!.number_of_tasbih,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Container(
              width: MediaQuery.of(context).size.height * 0.09,
              height: MediaQuery.of(context).size.height * 0.09,
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.03,
              ),
              decoration: BoxDecoration(
                color: provider.appTheme == ThemeMode.light
                    ? AppColors.primaryMoreLightColor
                    : AppColors.primaryDarkColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "$counter",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  ///width  ///height
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.550,
                      MediaQuery.of(context).size.height * 0.07),
                  backgroundColor: provider.appTheme == ThemeMode.light
                      ? AppColors.primaryMoreLightColor
                      : AppColors.yellowColor,
                ),
                onPressed: () {
                  resetCounter();
                  turns += 1 / 10;
                  setState(() {});
                },
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    prayers[prayerIndex],
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.blueDarkColor,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void resetCounter() {
    counter++;
    if (counter % 34 == 0) {
      counter = 0;
      prayerIndex = (prayerIndex + 1) % prayers.length;
      setState(() {});
    }
  }
}
