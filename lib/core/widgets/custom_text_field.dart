import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData prefixIcon;
  final bool isPassword;
  final Color fillColor;       
  final Color? hintColor;      
  final Color? iconColor;      
  final Color? textColor;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.prefixIcon,
    this.isPassword = false,
    this.fillColor = Colors.white, 
    this.hintColor,
    this.iconColor,
    this.textColor,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final Color activeHintColor = hintColor ?? Colors.grey.shade400;
    final Color activeIconColor = iconColor ?? Colors.grey.shade400;
    final Color activeTextColor = textColor ?? (fillColor == Colors.white ? const Color(0xFF120E16) : Colors.white);

    return TextField(
      obscureText: isPassword,
      style: TextStyle(color: activeTextColor), 
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: activeHintColor, fontSize: 14),
        prefixIcon: Icon(prefixIcon, color: activeIconColor, size: 20),
        suffixIcon: suffixIcon ?? (isPassword 
            ? Icon(Icons.visibility_off_outlined, color: activeIconColor, size: 20) 
            : null),
        filled: true,
        fillColor: fillColor,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}