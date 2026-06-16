import 'package:flutter/material.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    if (_currentIndex == index) {
      return;
    } else {
      _currentIndex = index;
      notifyListeners(); 
    }
  }

  Future<bool> handleWillPop() async {
    if (_currentIndex != 0) {
      changeIndex(0);
      return false;
    }
    return true;
  }
}