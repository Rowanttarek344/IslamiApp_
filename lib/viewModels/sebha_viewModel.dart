import 'package:islami_app/models/sebha_model.dart';

class sebha_viewModel{
  var sebha_Model=sebha_model();

  void onSebhaTap()
  {
    sebha_Model.count++;
    sebha_Model.angle+=100/33;
    if(sebha_Model.count%33==0)
    {
      sebha_Model.index++;
    }
    if(sebha_Model.index==sebha_Model.tasbeh.length)
    {
      sebha_Model.index=0;
    }


  }

}