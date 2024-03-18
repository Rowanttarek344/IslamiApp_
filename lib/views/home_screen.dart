import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Themes/MyTheme.dart';
import 'package:islami_app/views/hadeth_views/hadeth_tab.dart';
import 'package:islami_app/providers/AppConfigProvider.dart';
import 'package:islami_app/views/quran_views/quran_tab.dart';
import 'package:islami_app/views/radio_views/radio_tab.dart';
import 'package:islami_app/views/sebha_tab.dart';
import 'package:islami_app/views/quran_views/suraName.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/views/settings_tab.dart';
import 'package:provider/provider.dart';

class home_screen extends StatefulWidget{
  static const routeName="home_screen";

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  int selectedIndex=0;
  List<Widget> tabs=[radio_tab(),sebha_tab(),hadeth_tab(),quran_tab(),settings_tab()];


  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.appMode==ThemeMode.light?
        Image.asset("assets/images/default_bg.png",
          height: double.infinity,
          width: double.infinity,
          fit:BoxFit.fill,):
        Image.asset("assets/images/dark_bg.png",
          height: double.infinity,
          width: double.infinity,
          fit:BoxFit.fill,),

        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.islami,style: Theme.of(context).primaryTextTheme.headline1,),
            centerTitle: true,
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: provider.appMode==ThemeMode.light?
                    Theme.of(context).primaryColor:
                    Theme.of(context).primaryColor
            ),
            child: BottomNavigationBar(
                      items:[
                      BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),label: AppLocalizations.of(context)!.radio),
                      BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),label: AppLocalizations.of(context)!.sebha),
                      BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),label: AppLocalizations.of(context)!.hadeth),
                        BottomNavigationBarItem(
                            icon: ImageIcon(AssetImage("assets/images/icon_quran.png")),label: AppLocalizations.of(context)!.quran),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.settings),label: AppLocalizations.of(context)!.settings),

            ],
              onTap: (index){
                        selectedIndex=index;
                        setState(() {

                        });
              },
              currentIndex: selectedIndex,
            )
            ),
          body: tabs[selectedIndex],



          )





      ],

    );
  }
}