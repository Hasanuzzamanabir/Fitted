import 'package:flutter/material.dart';

class SubscriptionProvider extends ChangeNotifier {
  int _selectedPlanIndex = 1;

  int get selectedPlanIndex => _selectedPlanIndex;

  String get selectedPlanTitle => _selectedPlanIndex == 0 ? "Monthly" : "Yearly";

  void updatePlanIndex(int index) {
    _selectedPlanIndex = index;
    notifyListeners();
  }
}