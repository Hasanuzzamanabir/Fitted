import 'package:flutter/material.dart';
import 'package:fitted/core/theme/font_manager.dart';

class CustomSectionTitle extends StatelessWidget {
  final String title;
  final Color? color;

  const CustomSectionTitle({
    super.key,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: FontManager.playfairH3().copyWith(
        color: color ?? Colors.white,
      ),
    );
  }
}