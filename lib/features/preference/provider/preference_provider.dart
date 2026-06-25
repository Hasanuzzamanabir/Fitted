// import 'package:flutter/material.dart';

// class PreferenceProvider extends ChangeNotifier {
//   int _currentStep = 0;
//   int get currentStep => _currentStep;

//   String? _gender;
//   String? get gender => _gender;

//   String? _ageZone;
//   String? get ageZone => _ageZone;

//   bool _isDressingKids = false;
//   bool get isDressingKids => _isDressingKids;

//   final List<String> _selectedVibes = [];
//   List<String> get selectedVibes => _selectedVibes;

//   final List<Map<String, dynamic>> _colorVibes = [
//     {
//       "name": "Neutrals",
//       "hexList": ["E5E0D8", "CDC3B4", "8B8275", "403A33"],
//       "subtitle": "#E5E0D8  #CDC3B4  #8B8275\n#403A33"
//     },
//     {
//       "name": "Earth",
//       "hexList": ["B07C56", "D9A066", "8C5835", "402816"],
//       "subtitle": "#B07C56  #D9A066  #8C5835\n#402816"
//     },
//     {
//       "name": "Mono Carbon",
//       "hexList": ["2A2A2A", "404040", "1B1B1B", "111111"],
//       "subtitle": "#2A2A2A  #404040  #1B1B1B\n#111111"
//     },
//     {
//       "name": "Pastels",
//       "hexList": ["F4EAE1", "E3EFF2", "E8E5F2", "F2E6ED"],
//       "subtitle": "#F4EAE1  #E3EFF2  #E8E5F2\n#F2E6ED"
//     },
//     {
//       "name": "Forest",
//       "hexList": ["1B4D3E", "2C6B56", "4F8F75", "A3C9A8"],
//       "subtitle": "#1B4D3E  #2C6B56  #4F8F75\n#A3C9A8"
//     },
//     {
//       "name": "Brights",
//       "hexList": ["E84C3D", "F1C40F", "9B59B6", "3498DB"],
//       "subtitle": "#E84C3D  #F1C40F  #9B59B6\n#3498DB"
//     },
//     {
//       "name": "Denim & Indigo",
//       "hexList": ["2C3E50", "34495E", "2980B9", "5DADE2"],
//       "subtitle": "#2C3E50  #34495E  #2980B9\n#5DADE2"
//     },
//     {
//       "name": "Noir & Gold",
//       "hexList": ["111111", "D4AF37", "222222", "AA7C11"],
//       "subtitle": "#111111  #D4AF37  #222222\n#AA7C11"
//     },
//   ];
//   List<Map<String, dynamic>> get colorVibes => _colorVibes;

//   final List<String> _selectedColors = [];
//   List<String> get selectedColors => _selectedColors;

//   String? _preferredFit;
//   String? get preferredFit => _preferredFit;

//   double _priceRange = 0.5;
//   double get priceRange => _priceRange;

//   void nextStep() {
//     if (_currentStep < 3) {
//       _currentStep++;
//       notifyListeners();
//     }
//   }

//   void previousStep() {
//     if (_currentStep > 0) {
//       _currentStep--;
//       notifyListeners();
//     }
//   }

//   void setGender(String value) {
//     if (_gender != value) {
//       _gender = value;
//       _selectedVibes.clear(); 
//       notifyListeners();
//     }
//   }

//   void setAgeZone(String value) {
//     _ageZone = value;
//     notifyListeners();
//   }

//   void setDressingKids(bool value) {
//     _isDressingKids = value;
//     notifyListeners();
//   }

//   void toggleVibe(String vibeTitle) {
//     if (_selectedVibes.contains(vibeTitle)) {
//       _selectedVibes.remove(vibeTitle);
//     } else {
//       _selectedVibes.add(vibeTitle);
//     }
//     notifyListeners();
//   }

//   void toggleColor(String colorHex) {
//     if (_selectedColors.contains(colorHex)) {
//       _selectedColors.remove(colorHex);
//     } else {
//       _selectedColors.add(colorHex);
//     }
//     notifyListeners();
//   }

//   void addCustomColor(String combinedHexCodes) {
//     List<String> hexList = combinedHexCodes.split(",");
//     String mainHex = hexList[0];

//     bool exists = _colorVibes.any((element) {
//       final List<dynamic> list = element["hexList"];
//       return list.any((hex) => hex.toString().toUpperCase() == mainHex.toUpperCase());
//     });

//     if (!exists) {
//       _colorVibes.add({
//         "name": "Custom ${_colorVibes.length - 7}",
//         "hexList": hexList,
//         "subtitle": hexList.map((h) => "#$h").join("  "),
//       });
//       _selectedColors.add(mainHex);
//       notifyListeners();
//     }
//   }

//   void setPreferredFit(String value) {
//     _preferredFit = value;
//     notifyListeners();
//   }

//   void setPriceRange(double value) {
//     _priceRange = value;
//     notifyListeners();
//   }

//   void initializeData({
//     required String gender,
//     required String ageZone,
//     required bool isDressingKids,
//     required List<String> selectedVibes,
//     required List<String> selectedColors,
//     required String preferredFit,
//     required double priceRange,
//   }) {
//     _gender = gender;
//     _ageZone = ageZone;
//     _isDressingKids = isDressingKids;
//     _selectedVibes.clear();
//     _selectedVibes.addAll(selectedVibes);
//     _selectedColors.clear();
//     _selectedColors.addAll(selectedColors);
//     _preferredFit = preferredFit;
//     _priceRange = priceRange;
//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';

class PreferenceProvider extends ChangeNotifier {
  int _currentStep = 0;
  int get currentStep => _currentStep;

  String? _gender;
  String? get gender => _gender;

  String? _ageZone;
  String? get ageZone => _ageZone;

  bool _isDressingKids = false;
  bool get isDressingKids => _isDressingKids;

  final List<String> _selectedVibes = [];
  List<String> get selectedVibes => _selectedVibes;

  final List<Map<String, dynamic>> _colorVibes = [
    {
      "name": "Neutrals",
      "hexList": ["E5E0D8", "CDC3B4", "8B8275", "403A33"],
      "subtitle": "#E5E0D8  #CDC3B4  #8B8275\n#403A33"
    },
    {
      "name": "Earth",
      "hexList": ["B07C56", "D9A066", "8C5835", "402816"],
      "subtitle": "#B07C56  #D9A066  #8C5835\n#402816"
    },
    {
      "name": "Mono Carbon",
      "hexList": ["2A2A2A", "404040", "1B1B1B", "111111"],
      "subtitle": "#2A2A2A  #404040  #1B1B1B\n#111111"
    },
    {
      "name": "Pastels",
      "hexList": ["F4EAE1", "E3EFF2", "E8E5F2", "F2E6ED"],
      "subtitle": "#F4EAE1  #E3EFF2  #E8E5F2\n#F2E6ED"
    },
    {
      "name": "Forest",
      "hexList": ["1B4D3E", "2C6B56", "4F8F75", "A3C9A8"],
      "subtitle": "#1B4D3E  #2C6B56  #4F8F75\n#A3C9A8"
    },
    {
      "name": "Brights",
      "hexList": ["E84C3D", "F1C40F", "9B59B6", "3498DB"],
      "subtitle": "#E84C3D  #F1C40F  #9B59B6\n#3498DB"
    },
    {
      "name": "Denim & Indigo",
      "hexList": ["2C3E50", "34495E", "2980B9", "5DADE2"],
      "subtitle": "#2C3E50  #34495E  #2980B9\n#5DADE2"
    },
    {
      "name": "Noir & Gold",
      "hexList": ["111111", "D4AF37", "222222", "AA7C11"],
      "subtitle": "#111111  #D4AF37  #222222\n#AA7C11"
    },
  ];
  List<Map<String, dynamic>> get colorVibes => _colorVibes;

  final List<String> _selectedColors = [];
  List<String> get selectedColors => _selectedColors;

  String? _preferredFit;
  String? get preferredFit => _preferredFit;

  double _priceRange = 0.5;
  double get priceRange => _priceRange;

  // ইউআই-তে প্রাইস লেভেলের ডলার সাইন ($ / $$ / $$$) ডাইনামিক দেখানোর গেটার মেথড
  String get priceLevelLabel {
    if (_priceRange == 0.0) return "\$";
    if (_priceRange == 0.5) return "\$\$";
    return "\$\$\$\$";
  }

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
    if (_gender != value) {
      _gender = value;
      _selectedVibes.clear(); 
      notifyListeners();
    }
  }

  void setAgeZone(String value) {
    _ageZone = value;
    notifyListeners();
  }

  void setDressingKids(bool value) {
    _isDressingKids = value;
    notifyListeners();
  }

  void toggleVibe(String vibeTitle) {
    if (_selectedVibes.contains(vibeTitle)) {
      _selectedVibes.remove(vibeTitle);
    } else {
      _selectedVibes.add(vibeTitle);
    }
    notifyListeners();
  }

  void toggleColor(String colorHex) {
    if (_selectedColors.contains(colorHex)) {
      _selectedColors.remove(colorHex);
    } else {
      _selectedColors.add(colorHex);
    }
    notifyListeners();
  }

  void addCustomColor(String combinedHexCodes) {
    List<String> hexList = combinedHexCodes.split(",");
    String mainHex = hexList[0];

    bool exists = _colorVibes.any((element) {
      final List<dynamic> list = element["hexList"];
      return list.any((hex) => hex.toString().toUpperCase() == mainHex.toUpperCase());
    });

    if (!exists) {
      _colorVibes.add({
        "name": "Custom ${_colorVibes.length - 7}",
        "hexList": hexList,
        "subtitle": hexList.map((h) => "#$h").join("  "),
      });
      _selectedColors.add(mainHex);
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
    required bool isDressingKids,
    required List<String> selectedVibes,
    required List<String> selectedColors,
    required String preferredFit,
    required double priceRange,
  }) {
    _gender = gender;
    _ageZone = ageZone;
    _isDressingKids = isDressingKids;
    _selectedVibes.clear();
    _selectedVibes.addAll(selectedVibes);
    _selectedColors.clear();
    _selectedColors.addAll(selectedColors);
    _preferredFit = preferredFit;
    _priceRange = priceRange;
    notifyListeners();
  }
}