import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/viewModels/quran_viewModels/quran_viewModel.dart';
import 'package:islami_app/views/home_screen.dart';
import 'package:islami_app/providers/AppConfigProvider.dart';
import 'package:islami_app/views/quran_views/suraName.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';



import '../../Themes/MyTheme.dart';

class quran_tab extends StatelessWidget{
  static const String routeName="quran_tab";
  var data=quran_viewModel();

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Column(
        children: [
          Center(child: Image.asset("assets/images/qur2an_screen_logo.png")),
          Divider(thickness:3,color:
            provider.appMode==ThemeMode.light?
                MyTheme.gold_color:
                MyTheme.yellow_color,),
          Text(AppLocalizations.of(context)!.suraName,style:Theme.of(context).primaryTextTheme.headline4 ,),
          Divider(thickness:3,color:
          provider.appMode==ThemeMode.light?
          MyTheme.gold_color:
          MyTheme.yellow_color,),
          Expanded(
            child: ListView.builder(itemBuilder: (context,index) => suraName(
                name: data.quran_Model.sura[index],index: index),
              itemCount: data.quran_Model.sura.length,
            ),
          ),


        ]);
  }

}