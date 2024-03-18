import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/views/hadeth_views/hadethName.dart';
import 'package:islami_app/views/quran_views/suraName.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


import '../../Themes/MyTheme.dart';
import '../../providers/AppConfigProvider.dart';

class hadeth_tab extends StatefulWidget{
  static const String routeName="hadeth_tab";

  @override
  State<hadeth_tab> createState() => _hadeth_tabState();
}

class _hadeth_tabState extends State<hadeth_tab> {
  List<hadethItem>ahadethList=[];

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);

    if(ahadethList.isEmpty){
      loadfile();
    }
    return Column(
        children: [
          Center(child: Image.asset("assets/images/hadeth_image.png")),
          Divider(thickness:3,color:
          provider.appMode==ThemeMode.light?
          MyTheme.gold_color:
          MyTheme.yellow_color,),
          Text(AppLocalizations.of(context)!.hadethName,style:Theme.of(context).primaryTextTheme.headline4),
          Divider(thickness:3,color:
          provider.appMode==ThemeMode.light?
          MyTheme.gold_color:
          MyTheme.yellow_color,),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) => hadethName(title: ahadethList[index].title,content:ahadethList[index].content),

                itemCount: ahadethList.length),
          )



        ]);
  }

  void loadfile()async{
    String ahadeth= await rootBundle.loadString("assets/hadeth/ahadeth.txt");
    List<String> allahadeth=ahadeth.split('#\r\n');
    for(int i=0;i<allahadeth.length;i++)
      {
        List<String>hadeth = allahadeth[i].split('\n');
        String title=hadeth[0];
        hadeth.removeAt(0);
        hadethItem hadethitem=hadethItem(title: title, content: hadeth);
        ahadethList.add(hadethitem);
      }
    setState(() {

    });


  }
}
class hadethItem{
  String title;
  List<String>content;
  hadethItem({required this.title,required this.content});
}