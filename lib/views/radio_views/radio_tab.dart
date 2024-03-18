import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/viewModels/radio_viewModels/radio_tab_viewModel.dart';
import 'package:islami_app/views/radio_views/radioItem.dart';

import '../../models/radio_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class radio_tab extends StatefulWidget{
  static const String routeName="radio_tab";

  @override
  State<radio_tab> createState() => _radio_tabState();
}

class _radio_tabState extends State<radio_tab> {
  var audioPlayer=AudioPlayer();
  var data=radio_tab_viewModel();

  @override
  Widget build(BuildContext context) {
    var screen_size=MediaQuery.of(context).size;

    return FutureBuilder<radio_model>(
      future: data.getRadios(),
      builder: (context, snapshot) {
        if (snapshot.hasData){
          var radios=snapshot.data?.radios ?? [];
        return Column(
        children:[
          Expanded(
            flex: 3,
             child: Image.asset("assets/images/radio_image.png"),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
                itemBuilder: (context, index) => Center(
                  child: SizedBox(width:screen_size.width,
                      child: radioItem(radios[index],audioPlayer)),
                ),
                itemCount: radios.length,
                physics: PageScrollPhysics(),
                scrollDirection:Axis.horizontal ,),
          )

      ]);}
        else if(snapshot.hasError)
          {
            return Text('${snapshot.error ?? ''}');
          }
        else
          {
            return Center(child: CircularProgressIndicator(),);
          }
      }
    );
  }


}