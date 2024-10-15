import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/model/RadioModel.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class RadioItem extends StatefulWidget {
  Radios radio;
  final AudioPlayer audioPlayer;

  RadioItem({super.key, required this.radio, required this.audioPlayer});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool isPlay = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.arrow_left,
                color: provider.appTheme == ThemeMode.light
                    ? AppColors.primaryMoreLightColor
                    : AppColors.yellowColor,
                size: 40,
              ),
              Text(
                widget.radio.name ?? "",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Icon(
                Icons.arrow_right,
                color: provider.appTheme == ThemeMode.light
                    ? AppColors.primaryMoreLightColor
                    : AppColors.yellowColor,
                size: 40,
              ),
            ],
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.03,
          // ),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    isPlay = !isPlay;
                    if (isPlay == true) {
                      await widget.audioPlayer
                          .play(UrlSource(widget.radio.url!));
                    } else {
                      await widget.audioPlayer.pause();
                    }

                    setState(() {});
                  },
                  child: Icon(
                    isPlay == false ? Icons.play_arrow_rounded : Icons.pause,
                    color: provider.appTheme == ThemeMode.light
                        ? AppColors.primaryMoreLightColor
                        : AppColors.yellowColor,
                    size: 40,
                  ),
                ),
                Text(
                  isPlay == false
                      ? AppLocalizations.of(context)!.play_radio
                      : AppLocalizations.of(context)!.pause_radio,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: provider.appTheme == ThemeMode.light
                            ? AppColors.primaryLightColor
                            : AppColors.yellowColor,
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
