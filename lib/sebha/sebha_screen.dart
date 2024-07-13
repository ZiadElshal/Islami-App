import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

class SebhaScreen extends StatefulWidget {
  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: Colors.red,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.06,
        vertical: MediaQuery.of(context).size.height * 0.09,
      ),
      // margin: EdgeInsets.symmetric(
      //   horizontal: MediaQuery.of(context).size.width*0.06,
      //   vertical: MediaQuery.of(context).size.height*0.08,
      // ),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset("assets/images/sebha_head_logo.png"),
              Image.asset("assets/images/sebha_body_logo.png"),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "عدد التسبيحات",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Container(
            width: 70,
            height: 80,
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.03,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryMoreLightColor,
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
                fixedSize: Size(150, 51),
                backgroundColor: AppColors.primaryLightColor,
              ),
              onPressed: () {
                counter++;
                setState(() {});
              },
              child: Text(
                "سبحان الله",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.whiteColor,
                    ),
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }
}
