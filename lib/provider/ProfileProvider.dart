import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier{
  int _grado = 0;
  int _start = 0;
  int _level = 0;
  String _grupo = '';
  String _name = '';
  String _imgUrl = '';
  String _id = '';
  bool _teamStatus = false;

  

  int get grado => _grado;
  int get start => _start;
  int get level => _level;
  String get grupo => _grupo;
  String get name => _name;
  String get imgUrl => _imgUrl;
  String get id => _id;
  bool get teamStatus => _teamStatus;  

  void setData( String name,int grado ,String grupo, String imgUrl, String id, bool teamStatus, int start, 
      int level){
    _grado = grado;
    _grupo = grupo;
    _name = name;
    _imgUrl = imgUrl;
    _id = id;
    _teamStatus = teamStatus;
    _start = start;
    _level = level;

    notifyListeners();
  }
   void setDataCreate( String name,int grado ,String grupo){
    _grado = grado;
    _grupo = grupo;
    _name = name;
    notifyListeners();
  }

  void clearData(){
    _grado = 0;
    _start = 0;
    _teamStatus = false;
    _level = 0;
    _grupo = '';
    _name = '';
    _imgUrl = '';   
    _id = '';
    notifyListeners();
  }
}