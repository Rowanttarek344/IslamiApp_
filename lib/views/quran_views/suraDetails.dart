import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/viewModels/quran_viewModels/suraNameDetails_viewModel.dart';

class suraDetails extends StatelessWidget{
  String text;
  int index;
  suraDetails({required this.text,required this.index});
  @override
  Widget build(BuildContext context) {
    var data=suranNameDetails_viewModel();

    return Container(
      padding: EdgeInsets.all(12),
      child: Text("${text}(${index})",textAlign:TextAlign.center,
      textDirection: TextDirection.rtl,
      style: Theme.of(context).primaryTextTheme.headline5,),



    );
  }

}