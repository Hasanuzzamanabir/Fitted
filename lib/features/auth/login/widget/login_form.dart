import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_social_button.dart';
import 'package:fitted/core/widgets/custom_text_field.dart';
import 'package:fitted/features/auth/login/view/forgot_password_view.dart';
import 'package:flutter/material.dart';


class EmailForm extends StatelessWidget {
  const EmailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Email", style: TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        const CustomTextField(hint: "Enter email", prefixIcon: Icons.email_outlined),
        const SizedBox(height: 16),
        const Text("Password", style: TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        const CustomTextField(hint: "• • • • • • • •", prefixIcon: Icons.lock_outline, isPassword: true),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(value: false, onChanged: (val) {}, activeColor: AppColors.primecolor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                ),
                const SizedBox(width: 8),
                const Text("Remember me", style: TextStyle(fontSize: 13)),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, ForgotPasswordView.forgotPasswordView);
              },
              child: const Text(
                "Forgot password?",
                style: TextStyle(color: AppColors.subtext, fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        _buildPrimaryButton("Login"),
        const SizedBox(height: 20),
        const Center(child: Text("Or Continue with", style: TextStyle(color: AppColors.subtext, fontSize: 13))),
        const SizedBox(height: 15),
        SocialButton(label: "Google", icon: ImagePath.google, onTap: () {}),
      ],
    );
  }

  Widget _buildPrimaryButton(String label) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.subtext,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
        ),
        child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}