import 'package:flutter/material.dart';

class GlobalState with ChangeNotifier {
  String _grado = '';
  String _level = '';
  String _grupo = '';
  String _name = '';
  String _imgUrl = '';

  String get grado => _grado;
  String get level => _level;
  String get grupo => _grupo;
  String get name => _name;
  String get imgUrl => _imgUrl;

  void setJwtToken(String grado ,String level, String grupo, String name, String imgUrl){
    _grado = grado;
    _level = level;
    _grupo = grupo;
    _name = name;
    _imgUrl = imgUrl;
    notifyListeners();
  }

  void clearJwtToken(){
    _grado = '';
    _level = '';
    _grupo = '';
    _name = '';
    _imgUrl = '';   
    notifyListeners();
  }
}