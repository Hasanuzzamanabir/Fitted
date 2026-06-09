import 'package:fitted/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final bool isSelected;
  final bool showBadge;

  const PlanCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    this.isSelected = false,
    this.showBadge = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primecolor
            : const Color(0xff13123A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          if (showBadge)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Best value",
              ),
            ),

          const SizedBox(width: 10),

          Text(
            price,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}