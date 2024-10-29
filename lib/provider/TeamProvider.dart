import 'package:flutter/material.dart';

class TeamProvider extends ChangeNotifier{
  String _idTeam = '';

  String get idTeam => _idTeam;


  void setIdTeam(String idTeam){
    _idTeam = idTeam;  
    notifyListeners();
  }

  void clearIdTeam(){
    _idTeam = '';
    notifyListeners();
  }
}