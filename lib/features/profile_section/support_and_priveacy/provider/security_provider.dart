import 'package:flutter/material.dart';

class SecurityProvider extends ChangeNotifier {
  bool _isCurrentPasswordHidden = true;
  bool get isCurrentPasswordHidden => _isCurrentPasswordHidden;

  bool _isNewPasswordHidden = true;
  bool get isNewPasswordHidden => _isNewPasswordHidden;

  bool _isConfirmPasswordHidden = true;
  bool get isConfirmPasswordHidden => _isConfirmPasswordHidden;

  void toggleCurrentPassword() {
    _isCurrentPasswordHidden = !_isCurrentPasswordHidden;
    notifyListeners();
  }

  void toggleNewPassword() {
    _isNewPasswordHidden = !_isNewPasswordHidden;
    notifyListeners();
  }

  void toggleConfirmPassword() {
    _isConfirmPasswordHidden = !_isConfirmPasswordHidden;
    notifyListeners();
  }

  void clearStates() {
    _isCurrentPasswordHidden = true;
    _isNewPasswordHidden = true;
    _isConfirmPasswordHidden = true;
  }
}