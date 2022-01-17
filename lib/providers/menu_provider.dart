import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {
  bool menuOpen = false;

  void toggleMenuState(bool value) {
    menuOpen = value;
    notifyListeners();
  }
}
