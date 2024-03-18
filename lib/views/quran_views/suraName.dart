import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/views/quran_views/suraNameDetails.dart';

import '../../viewModels/quran_viewModels/quran_viewModel.dart';

class suraName extends StatelessWidget {
  var data=quran_viewModel();

  String name ;
  int index;
  suraName({required this.name,required this.index});


  @override
  Widget build(BuildContext context) {

    return InkWell(
      child: Text(
        name,
        style: Theme.of(context).primaryTextTheme.headline4,
        textAlign: TextAlign.center,
      ),
      onTap:(){
        data.sora_onTap(name, index, context);
      }

      ,
    );
  }
}
