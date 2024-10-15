import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/model/api_manager.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/radio/radio_item.dart';
import 'package:provider/provider.dart';

class RadioScreen extends StatefulWidget {
  final audioPlayer = AudioPlayer();

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return FutureBuilder(
        future: ApiManager.getRadios(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // var radios = snapshot.data?.radios ?? [];
            return Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.12,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.quran_radio,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Image.asset("assets/images/radio_logo.png"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return RadioItem(
                          // radio: radios[index],
                          radio: snapshot.data!.radios![index],
                          audioPlayer: widget.audioPlayer,
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      // itemCount: radios.length,
                      itemCount: snapshot.data!.radios!.length,
                      physics: PageScrollPhysics(),
                    ),
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            Text(snapshot.error.toString());
          }
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.primaryLightColor,
          ));
        });
  }
}
