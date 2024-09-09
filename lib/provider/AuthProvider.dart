import 'dart:ffi';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{
  String _jwtToken = '';
  String _email = '';

  String get jwtToken => _jwtToken;
  String get  email => _email;

  void setJwtToken(String jwtToken, String email){
    _jwtToken = jwtToken;
    _email = email;    
    notifyListeners();
  }

  void clearJwtToken(){
    _jwtToken = '';
    _email = '';
    notifyListeners();
  }
}