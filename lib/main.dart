import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Themes/MyTheme.dart';
import 'package:islami_app/views/hadeth_views/hadethDetails.dart';
import 'package:islami_app/views/hadeth_views/hadeth_tab.dart';
import 'package:islami_app/views/home_screen.dart';
import 'package:islami_app/providers/AppConfigProvider.dart';
import 'package:islami_app/views/quran_views/quran_tab.dart';
import 'package:islami_app/views/radio_views/radio_tab.dart';
import 'package:islami_app/views/sebha_tab.dart';
import 'package:islami_app/views/quran_views/suraNameDetails.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChangeNotifierProvider
    (create: (context) => AppConfigProvider(),
  child: myapp()));
}
class myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      routes: {
        home_screen.routeName:(context)=>home_screen(),
        radio_tab.routeName:(context)=>radio_tab(),
        sebha_tab.routeName:(context)=>sebha_tab(),
        hadeth_tab.routeName:(context)=>hadeth_tab(),
        quran_tab.routeName:(context)=>quran_tab(),
        suraNameDetails.routeName:(context)=>suraNameDetails(),
        hadethDetails.routeName:(context)=>hadethDetails(),

      },
      initialRoute:home_screen.routeName ,
      themeMode:provider.appMode ,
      theme: MyTheme.lightTheme ,
      darkTheme: MyTheme.darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }

}