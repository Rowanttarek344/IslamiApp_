import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Themes/MyTheme.dart';
import 'package:islami_app/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';



class hadethDetails extends StatelessWidget{
  static const String routeName="hadethDetails";
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    var args=ModalRoute.of(context)?.settings.arguments as hadethDetailsArgs;
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
                color:
                provider.appMode==ThemeMode.light?
                    MyTheme.white_color:
                    MyTheme.navy_color
            ),
            child: Column(
              children: [
                Center(child: Text(args.title,style: Theme.of(context).primaryTextTheme.headline3,)),
                Divider(thickness:2 ,color: Theme.of(context).primaryColor,),
                Expanded(
                  child: ListView.builder(itemBuilder:(context, index) => Container(
                    padding: EdgeInsets.all(20),
                      child: Text(args.content[index],textAlign: TextAlign.center,
                        style:Theme.of(context).primaryTextTheme.headline5 )),
                      itemCount: args.content.length)
                )

              ],
            ),
          ),


        )





      ],

    );

  }

}
class hadethDetailsArgs{
  String title;
  List<String> content;
  hadethDetailsArgs({required this.title,required this.content});
}