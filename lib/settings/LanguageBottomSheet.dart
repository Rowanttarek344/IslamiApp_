import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Themes/MyTheme.dart';
import 'package:islami_app/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Container(
      color: provider.appMode==ThemeMode.light?
      MyTheme.white_color:
      MyTheme.navy_color,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              provider.changeLanguage('en');
            },
            child: provider.appLanguage=='en'?
                getSelectedItemWidget(AppLocalizations.of(context)!.english,context):
                getUnselectedItemWidget(AppLocalizations.of(context)!.english,context)
          ),
          SizedBox(height: 12,),
          InkWell(
              onTap: (){
                provider.changeLanguage('ar');
              },
              child: provider.appLanguage=='ar'?
              getSelectedItemWidget(AppLocalizations.of(context)!.arabic,context):
              getUnselectedItemWidget(AppLocalizations.of(context)!.arabic,context)
          )

        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String language,BuildContext context){
    var provider=Provider.of<AppConfigProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(language,style: Theme.of(context).primaryTextTheme.subtitle1),
        Icon(Icons.check,
            color: provider.appMode==ThemeMode.light?
            MyTheme.gold_color:
            MyTheme.yellow_color
        )
      ],
    );
  }

  Widget getUnselectedItemWidget(String language,BuildContext context){
    return Text(language,style: Theme.of(context).primaryTextTheme.headline4,);
  }
}