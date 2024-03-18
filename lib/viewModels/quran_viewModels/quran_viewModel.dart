import 'package:flutter/cupertino.dart';

import '../../models/quran_models/quran_model.dart';
import 'package:islami_app/views/quran_views/suraNameDetails.dart';


class quran_viewModel{
  var quran_Model=quran_model();

  sora_onTap(String name,int index,BuildContext context){
    Navigator.of(context)
        .pushNamed(suraNameDetails.routeName,
        arguments: suraNameArgs(name: name, index: index));


  }
}