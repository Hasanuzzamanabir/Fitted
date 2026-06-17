import 'package:flutter/material.dart';

class OutfitRecommendationProvider extends ChangeNotifier {
  bool _isExpanded = false;
  String _currentCoverImage = 'https://images.unsplash.com/photo-1534528741775-53994a69daeb';

  final List<Map<String, String>> _breakdownItems = [
    {
      "image": "https://images.unsplash.com/photo-1603252109303-2751441dd157?q=80&w=600&auto=format&fit=crop",
      "brand": "Everlane",
      "title": "Silk Camisole"
    },
    {
      "image": "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?q=80&w=600&auto=format&fit=crop",
      "brand": "Reformation",
      "title": "Tailored Wide Leg"
    },
    {
      "image": "https://images.unsplash.com/photo-1591047139829-d91aecb6caea?q=80&w=600&auto=format&fit=crop",
      "brand": "Anine Bing",
      "title": "Oversized Blazer"
    },
    {
      "image": "https://images.unsplash.com/photo-1614252235316-8c857d38b5f4?q=80&w=600&auto=format&fit=crop",
      "brand": "Gucci",
      "title": "Leather Loafers"
    }
  ];

  bool get isExpanded => _isExpanded;
  String get currentCoverImage => _currentCoverImage;
  List<Map<String, String>> get breakdownItems => _breakdownItems;

  void toggleExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  void regenerateOutfit(String prompt) {
    if (prompt.isNotEmpty) {
      _currentCoverImage = 'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?q=80&w=600&auto=format&fit=crop';
      _breakdownItems[0]["image"] = 'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=600&auto=format&fit=crop';
      _breakdownItems[1]["image"] = 'https://images.unsplash.com/photo-1509631179647-0177331693ae?q=80&w=600&auto=format&fit=crop';
      _breakdownItems[2]["image"] = 'https://images.unsplash.com/photo-1483985988355-763728e1935b?q=80&w=600&auto=format&fit=crop';
      _breakdownItems[3]["image"] = 'https://images.unsplash.com/photo-1554520735-0a6b8b6ce8b7?q=80&w=600&auto=format&fit=crop';
      notifyListeners();
    }
  }
}