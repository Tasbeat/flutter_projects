import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }
}
