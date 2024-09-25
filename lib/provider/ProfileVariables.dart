import 'package:flutter/material.dart';

class ProfileVariables extends ChangeNotifier{
  int _grado = 0;
  String _level = '';
  String _grupo = '';
  String _name = '';
  String _imgUrl = '';

  int get grado => _grado;
  String get level => _level;
  String get grupo => _grupo;
  String get name => _name;
  String get imgUrl => _imgUrl;
  

  void setData( String name,int grado ,String grupo){
    _grado = grado;
    _grupo = grupo;
    _name = name;
    notifyListeners();
  }

  void clearData(){
    _grado = 0;
    _level = '';
    _grupo = '';
    _name = '';
    _imgUrl = '';   
    notifyListeners();
  }
}