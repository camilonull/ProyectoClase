import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {
  
  int buttonNavigatorBarIndex = 0;

  int get bnbIndex => buttonNavigatorBarIndex;

  set bnbIndex(int i) {
    buttonNavigatorBarIndex = i;
    notifyListeners();
  }
}