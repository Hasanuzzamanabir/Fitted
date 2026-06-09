import 'package:fitted/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TrialButton extends StatelessWidget {
  final VoidCallback onTap;

  const TrialButton({
    super.key,
     required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(
        onPressed: onTap,
        child: const Text(
          "Start 7-day free trial",
          style: TextStyle(
            color: AppColors.primecolor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}