import 'package:flutter/material.dart';

class PremiumHeader extends StatelessWidget {
  const PremiumHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 34,
          backgroundColor: Colors.pink,
          child: Icon(
            Icons.auto_awesome,
            color: Colors.white,
            size: 34,
          ),
        ),
        const SizedBox(height: 12),

        const Text(
          "Pure Style",
          style: TextStyle(
            color: Colors.pink,
          ),
        ),

        const SizedBox(height: 10),

        const Text(
          "Become a Style Pro",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: const Text(
            "Unlock personalized fashion recommendations, wardrobe insights, and exclusive styling tools tailored to your taste.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}