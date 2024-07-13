import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

class RadioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              "إذاعة القرآن الكريم",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.first_page_rounded,
                    color: AppColors.primaryLightColor,
                    size: 40,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: AppColors.primaryLightColor,
                    size: 40,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.last_page_rounded,
                    color: AppColors.primaryLightColor,
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
