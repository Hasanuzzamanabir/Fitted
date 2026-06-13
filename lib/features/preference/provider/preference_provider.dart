import 'package:flutter/material.dart';

class PreferenceProvider extends ChangeNotifier {
  int _currentStep = 0;
  int get currentStep => _currentStep;

  String? _gender;
  String? get gender => _gender;

  String? _ageZone;
  String? get ageZone => _ageZone;

  // স্টেপ ২: মাল্টিপল ভাইব সিলেকশনের জন্য এখন এটি List
  final List<String> _selectedVibes = [];
  List<String> get selectedVibes => _selectedVibes;

  // স্টেপ ৩: কালার লিস্ট
  final List<Map<String, String>> _colorVibes = [
    {"name": "Neutrals", "hex": "E5E0D8"},
    {"name": "Earth", "hex": "3B2A24"},
    {"name": "Mono C.", "hex": "2A2A2A"},
    {"name": "Pastels", "hex": "F0E4E4"},
    {"name": "Mono C.", "hex": "1B4D3E"},
    {"name": "Brights", "hex": "E84C3D"},
  ];
  List<Map<String, String>> get colorVibes => _colorVibes;

  // স্টেপ ৩: মাল্টিপল কালার সিলেকশন লিস্ট
  final List<String> _selectedColors = [];
  List<String> get selectedColors => _selectedColors;

  String? _preferredFit;
  String? get preferredFit => _preferredFit;

  double _priceRange = 0.5;
  double get priceRange => _priceRange;

  void nextStep() {
    if (_currentStep < 3) {
      _currentStep++;
      notifyListeners();
    }
  }

  void previousStep() {
    if (_currentStep > 0) {
      _currentStep--;
      notifyListeners();
    }
  }

  void setGender(String value) {
    _gender = value;
    notifyListeners();
  }

  void setAgeZone(String value) {
    _ageZone = value;
    notifyListeners();
  }

  // স্টেপ ২: মাল্টিপল ভাইব টগল করার লজিক
  void toggleVibe(String vibeTitle) {
    if (_selectedVibes.contains(vibeTitle)) {
      _selectedVibes.remove(vibeTitle);
    } else {
      _selectedVibes.add(vibeTitle);
    }
    notifyListeners();
  }

  // স্টেপ ৩: মাল্টিপল কালার টগল করার লজিক
  void toggleColor(String colorHex) {
    if (_selectedColors.contains(colorHex)) {
      _selectedColors.remove(colorHex);
    } else {
      _selectedColors.add(colorHex);
    }
    notifyListeners();
  }

  void addCustomColor(String hexCode) {
    bool exists = _colorVibes.any((element) => element["hex"]!.toUpperCase() == hexCode.toUpperCase());
    if (!exists) {
      _colorVibes.add({
        "name": "Custom ${_colorVibes.length - 5}",
        "hex": hexCode,
      });
      _selectedColors.add(hexCode);
      notifyListeners();
    }
  }

  void setPreferredFit(String value) {
    _preferredFit = value;
    notifyListeners();
  }

  void setPriceRange(double value) {
    _priceRange = value;
    notifyListeners();
  }
  void initializeData({
  required String gender,
  required String ageZone,
  required List<String> selectedVibes,
  required List<String> selectedColors,
  required String preferredFit,
  required double priceRange,
}) {
  _gender = gender;
  _ageZone = ageZone;
  _selectedVibes.clear();
  _selectedVibes.addAll(selectedVibes);
  _selectedColors.clear();
  _selectedColors.addAll(selectedColors);
  _preferredFit = preferredFit;
  _priceRange = priceRange;
  notifyListeners();
}
}