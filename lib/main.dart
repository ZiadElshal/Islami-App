import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/hadith/hadith_details_screen.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/quran/sura_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final String? savedLanguage = sharedPreferences.getString("appLanguage");
  final bool? theme = sharedPreferences.getBool("appTheme");

  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(
          appLanguage: savedLanguage ?? "ar", mode: theme ?? false),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadithDetailsScreen.routeName: (context) => HadithDetailsScreen(),
      },
      themeMode: provider.appTheme,
      theme: MyThemeData.lightMode,
      darkTheme: MyThemeData.darkMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }
}
