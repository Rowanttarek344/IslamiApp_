import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/providers/AppConfigProvider.dart';
import 'package:islami_app/settings/LanguageBottomSheet.dart';
import 'package:islami_app/settings/ThemeBottomSheet.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Themes/MyTheme.dart';
import '../viewModels/settings_viewModel.dart';


class settings_tab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var data=settings_viewModel();
    var provider=Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.language, style: Theme.of(context).primaryTextTheme.headline3),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12)),
              color:provider.appMode==ThemeMode.light?
              MyTheme.gold_color:
              MyTheme.yellow_color
              ,),
            child: InkWell(
              onTap: (){
                data.showLanguageBottomSheet(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  provider.appLanguage=='en'?
                  Text(AppLocalizations.of(context)!.english,style: Theme.of(context).primaryTextTheme.subtitle2,):
                  Text(AppLocalizations.of(context)!.arabic,style: Theme.of(context).primaryTextTheme.subtitle2),
                  Icon(Icons.arrow_drop_down_outlined)
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Text(AppLocalizations.of(context)!.theme, style: Theme.of(context).primaryTextTheme.headline3),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12)),
              color: provider.appMode==ThemeMode.light?
              MyTheme.gold_color:
              MyTheme.yellow_color
              ,),
            child: InkWell(
              onTap: (){
                data.showThemeBottomSheet(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  provider.appMode==ThemeMode.light?
                  Text(AppLocalizations.of(context)!.light,style: Theme.of(context).primaryTextTheme.subtitle2):
                  Text(AppLocalizations.of(context)!.dark,style: Theme.of(context).primaryTextTheme.subtitle2),
                  Icon(Icons.arrow_drop_down_outlined)
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }



}