import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Themes/MyTheme.dart';
import 'package:provider/provider.dart';

import '../../models/radio_model.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../providers/AppConfigProvider.dart';

class radioItem extends StatefulWidget{
  Radios radio;
  var audioPlayer;
  radioItem(this.radio,this.audioPlayer);

  @override
  State<radioItem> createState() => _radioItemState();
}

class _radioItemState extends State<radioItem> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);

    return Column(
      children: [
        Text(widget.radio.name ?? '',style:Theme.of(context).primaryTextTheme.headline4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            provider.appMode==ThemeMode.light?
            IconButton(onPressed:play, icon: Icon(Icons.pause_circle_filled_rounded,size:40 ,),):
            IconButton(onPressed:play, icon: Icon(Icons.pause_circle_filled_rounded,size:40 ,color: MyTheme.yellow_color,),),
            provider.appMode==ThemeMode.light?
            IconButton(onPressed:pause, icon: Icon(Icons.play_circle_fill_rounded,size: 40,)):
            IconButton(onPressed:pause, icon: Icon(Icons.play_circle_fill_rounded,size: 40,color: MyTheme.yellow_color,))

          ],
        )
      ],
    );
  }

  void play() async{
    if(widget.radio.uRL != null){
      await widget.audioPlayer.play(UrlSource(widget.radio.uRL!));
    }
  }
  void pause() async{
    await widget.audioPlayer.pause();
  }
}