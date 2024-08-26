import 'package:flutter/material.dart';

class GlobalState with ChangeNotifier {
  Map<String, dynamic>? token;

  Map<String, dynamic>? get globalValue => token;

  set globalValue(Map<String, dynamic>? value) {
    token = value;
    notifyListeners();
  }
}