// import 'package:flutter/material.dart';
//
// class BottomNavigationBarWidget extends StatelessWidget {
//   String imagePath;
//   String text;
//   int currentIndex;
//
//   BottomNavigationBarWidget({super.key, required this.imagePath, required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Color(0xffB7935F),
//       currentIndex: selectedIndex,
//       onTap: (index){
//         selectedIndex = index;
//         setState(() {
//
//         });
//       },
//       items: [
//         BottomNavigationBarItem(
//           icon: ImageIcon(AssetImage("assets/images/quran_icon.png")),
//           label: "Quran",
//           backgroundColor: Color(0xffB7935F),
//
//         ),
//         BottomNavigationBarItem(
//           icon: ImageIcon(AssetImage("assets/images/hadeth_icon.png")),
//           label: "Hadith",
//
//         ),
//         BottomNavigationBarItem(
//           icon: ImageIcon(AssetImage("assets/images/sebha_icon.png")),
//           label: "Sebha",
//
//         ),
//         BottomNavigationBarItem(
//           icon: ImageIcon(AssetImage("assets/images/radio_icon.png")),
//           label: "Radio",
//
//         ),
//       ],
//     );
//   }
// }
