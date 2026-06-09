import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:fitted/core/widgets/custom_social_button.dart';
import 'package:fitted/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class PhoneForm extends StatelessWidget {
  const PhoneForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Phone Number", style: TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        const CustomTextField(hint: "+1   |   (555) 000-0000", prefixIcon: Icons.phone_android),
        const SizedBox(height: 25),
        
        CustomButtonWidget(
          title: "Send OTP",
          onTap: () {
            Navigator.pushNamed(context, "/verifyPhoneNumberOtp"); 
          },
        ),
        
        const SizedBox(height: 25),
        const Center(
          child: Text(
            "Or Continue with", 
            style: TextStyle(color: AppColors.subtext, fontSize: 13),
          ),
        ),
        const SizedBox(height: 15),
        SocialButton(label: "Google", icon: Icons.g_mobiledata, iconColor: Colors.red, onTap: () {}),
      ],
    );
  }
}