import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData prefixIcon;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.prefixIcon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        prefixIcon: Icon(prefixIcon, color: Colors.grey.shade400, size: 20),
        suffixIcon: isPassword 
            ? Icon(Icons.visibility_off_outlined, color: Colors.grey.shade400, size: 20) 
            : null,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}