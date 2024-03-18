import 'package:islami_app/models/radio_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class radio_tab_viewModel{
  var radio_Model=radio_model();

  Future<radio_model> getRadios() async{
    var uri=Uri.parse('https://www.mp3quran.net/api/radio/radio_ar.json');
    var response=await http.get(uri);
    if (response.statusCode==200)
    {

      var jsonn = json.decode(utf8.decode(response.bodyBytes));
      return radio_model.fromJson(jsonn);

    }
    else
    {
      throw Exception("failed to load radios");
    }




  }
}