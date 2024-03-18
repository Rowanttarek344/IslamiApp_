import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/views/quran_views/quran_tab.dart';
import 'package:islami_app/views/quran_views/suraDetails.dart';
import 'package:islami_app/views/radio_views/radio_tab.dart';
import 'package:islami_app/views/sebha_tab.dart';

import '../../Themes/MyTheme.dart';
import '../hadeth_views/hadeth_tab.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../../providers/AppConfigProvider.dart';


class suraNameDetails extends StatefulWidget{
  static const String routeName="suraNameDetails";
  //suraNameDetails({required this.name});

  @override
  State<suraNameDetails> createState() => _suraNameDetailsState();
}

class _suraNameDetailsState extends State<suraNameDetails> {


  List<String> verses=[];
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    var args=ModalRoute.of(context)?.settings.arguments as suraNameArgs;
    if(verses.isEmpty)
      {
        loadfile(args.index);
      }

    return Stack(
      children: [
        provider.appMode==ThemeMode.light?
        Image.asset("assets/images/default_bg.png",
            height: double.infinity,
            width: double.infinity,
            fit:BoxFit.fill
        ):
        Image.asset("assets/images/dark_bg.png",
            height: double.infinity,
            width: double.infinity,
            fit:BoxFit.fill
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.islami,style: Theme.of(context).primaryTextTheme.headline1,),
            centerTitle: true,
          ),
          body: Container(
            margin: EdgeInsets.symmetric(vertical: 50,horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: provider.appMode==ThemeMode.light?
              MyTheme.white_color:
              MyTheme.navy_color),
            child: Column(
              children: [
                Center(child: Text(args.name,style: Theme.of(context).primaryTextTheme.headline3,)),
                Divider(thickness:2 ,color: Theme.of(context).primaryColor,),
                Expanded(
                  child: verses.length==0?Center(child: CircularProgressIndicator()):
                  ListView.builder(itemBuilder:(_,index)=>suraDetails(text:verses[index],index: index+1,),
                      itemCount: verses.length),
                )

              ],
            ),
          ),


        )





      ],

    );
  }
  void loadfile(int index) async{
    String allsura= await rootBundle.loadString("assets/sura/${index+1}.txt");
    List<String> lines=allsura.split('\n');
    verses=lines;
    setState(() {

    });


  }
}
class suraNameArgs{
  String name;
  int index;
  suraNameArgs({required this.name,required this.index});
}