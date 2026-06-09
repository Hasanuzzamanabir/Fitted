import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.label,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 26, color: iconColor),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}