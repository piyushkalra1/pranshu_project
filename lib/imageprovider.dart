

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'ImagelistModel.dart';

class DataProvider with ChangeNotifier{


  List<Welcome> _welcomelist=[];
  List<Welcome> get welcomelist =>_welcomelist;
  bool _loading =false;
  bool get loading => _loading;
  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }

  Future<void> getMembers() async {

    setLoading(true);
    const url = "https://api.unsplash.com/photos/?client_id=8fZZLAtYG6LkkNbNsa7-_35CESYO-62CM5zQfc_-Nas";

    //Getting Already Saved Members from Server
    var response = await http.get(Uri.parse(url),);
    List responseData = json.decode(response.body);
    print(response.body);
    {
      print(response);
      _welcomelist = responseData.map((e) {
        return Welcome.fromJson(e);
      }).toList();
    }
    setLoading(false);
    notifyListeners();
  }

}