import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Themes/MyTheme.dart';
import 'package:islami_app/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math' as maths;

import '../viewModels/sebha_viewModel.dart';

class sebha_tab extends StatefulWidget{
  static const String routeName="sebha_tab";


  @override
  State<sebha_tab> createState() => _sebha_tabState();
}

class _sebha_tabState extends State<sebha_tab> {
  var data=sebha_viewModel();



  @override
  Widget build(BuildContext context) {

    var provider=Provider.of<AppConfigProvider>(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              provider.appMode==ThemeMode.light?
              Image.asset("assets/images/sebha_head.png"):
              Image.asset("assets/images/sebha_head_dark.png"),

              Transform.rotate(
                angle: maths.pi/100*data.sebha_Model.angle,
                child: GestureDetector(
                  onTap:(){
                    data.onSebhaTap();
                    setState(() {

                    });
                  } ,
                  child: Padding(
                    padding:EdgeInsets.all(MediaQuery.of(context).size.height*.08),
                    child: provider.appMode==ThemeMode.light?
                    Image.asset("assets/images/sebha_body.png"):
                    Image.asset("assets/images/sebha_body_dark.png"),
                  ),
                ),
              ),

            ],
          ),
          Text(AppLocalizations.of(context)!.numberOfTasbeh,
          style: Theme.of(context).primaryTextTheme.headline3,
          textAlign: TextAlign.center,),
          SizedBox(height: 12,),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Theme.of(context).primaryColor,
            ),
            child: Text(data.sebha_Model.count.toString(),style: Theme.of(context).primaryTextTheme.headline3,),

          ),
          SizedBox(height: 12,),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              color: provider.appMode==ThemeMode.light?
              MyTheme.gold_color:
              MyTheme.yellow_color,
            ),
            child: Text(data.sebha_Model.tasbeh[data.sebha_Model.index],style: TextStyle(
              color: provider.appMode==ThemeMode.light?
              MyTheme.white_color:
              MyTheme.black_color,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),

            ),

          ),



        ],

      ),
    );
  }


}