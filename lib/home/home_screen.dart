import 'package:flutter/material.dart';
import 'package:islami_app/hadith/hadith_screen.dart';
import 'package:islami_app/quran/quran_screen.dart';
import 'package:islami_app/radio/radio_screen.dart';
import 'package:islami_app/sebha/sebha_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Theme.of(context).primaryColor),
          child: BottomNavigationBar(
            backgroundColor: Color(0xffB7935F),
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/quran_icon.png")),
                label: "القرآن",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/hadeth_icon.png")),
                label: "الأحاديث",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/sebha_icon.png")),
                label: "التسبيح",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/radio_icon.png")),
                label: "الراديو",
              ),
            ],
          ),
        ),
        body: tabs[selectedIndex],
      ),
    ]);
  }

  List<Widget> tabs = [
    QuranScreen(),
    HadithScreen(),
    SebhaScreen(),
    RadioScreen()
  ];
}
