import 'package:flutter/material.dart';

class LoginTabProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  bool _isPasswordHidden = true;
  bool get isPasswordHidden => _isPasswordHidden;

  bool _rememberMe = false;
  bool get rememberMe => _rememberMe;

  final List<Map<String, dynamic>> tabs = [
    {"title": "Email", "icon": Icons.email_outlined},
    {"title": "Phone", "icon": Icons.phone_outlined},
  ];

  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }

  void toggleRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }
}