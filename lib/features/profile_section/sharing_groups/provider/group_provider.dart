import 'package:flutter/material.dart';

class GroupProvider extends ChangeNotifier {
  final TextEditingController groupNameController = TextEditingController();
  int _selectedCoverIndex = 0;

  int get selectedCoverIndex => _selectedCoverIndex;

  final List<List<Color>> coverGradients = [
    [const Color(0xFF9E4B61), const Color(0xFF532431)],
    [const Color(0xFF9E737B), const Color(0xFF53383D)],
    [const Color(0xFF5C755E), const Color(0xFF2B3A2C)],
    [const Color(0xFF5B798A), const Color(0xFF2A3D47)],
    [const Color(0xFF2C2F33), const Color(0xFF141619)],
    [const Color(0xFF8B3A2B), const Color(0xFF451911)],
    [const Color(0xFF8B733A), const Color(0xFF453816)],
    [const Color(0xFF2B5C43), const Color(0xFF122E1F)],
  ];
  final TextEditingController joinLinkController = TextEditingController();

  void joinGroup(BuildContext context) {
    String inviteLink = joinLinkController.text.trim();

    if (inviteLink.isEmpty) {
      return;
    }

    joinLinkController.clear();
    Navigator.of(context).pop();
  }

  void selectCover(int index) {
    _selectedCoverIndex = index;
    notifyListeners();
  }

  void createGroup(BuildContext context) {
    String groupName = groupNameController.text.trim();
    List<Color> selectedGradient = coverGradients[_selectedCoverIndex];

    if (groupName.isEmpty) {
      return;
    }

    groupNameController.clear();
    _selectedCoverIndex = 0;
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    groupNameController.dispose();
    super.dispose();
  }
}