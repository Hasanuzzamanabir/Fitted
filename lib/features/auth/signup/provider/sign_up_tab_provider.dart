import 'package:flutter/material.dart';

class SignUpTabProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
final List<Map<String, dynamic>> tabs = [
    {"title": "Email", "icon": Icons.email_outlined},
    {"title": "Phone", "icon": Icons.phone_outlined},
  ];
  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}