import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:fitted/core/widgets/custom_social_button.dart';
import 'package:fitted/core/widgets/custom_text_field.dart';
import 'package:fitted/features/auth/signup/view/sign_up_phone_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPhoneForm extends StatelessWidget {
  const SignUpPhoneForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "First Name", 
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                  ),
                  SizedBox(height: 8.h),
                  const CustomTextField(
                    hint: "First name", 
                    prefixIcon: Icons.person_outline,
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Last Name", 
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                  ),
                  SizedBox(height: 8.h),
                  const CustomTextField(
                    hint: "Last name", 
                    prefixIcon: Icons.person_outline,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
          "Phone Number", 
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
        ),
        SizedBox(height: 8.h),
        const CustomTextField(
          hint: "+1   |   (555) 000-0000", 
          prefixIcon: Icons.phone_android,
        ),
        SizedBox(height: 12.h),
         Text(
          "We'll send you a verification code via SMS", 
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
        ),
        SizedBox(height: 25.h),
        CustomButtonWidget(
          title: "Send OTP",
          onTap: () {
            Navigator.pushNamed(context, SignUpPhoneOtp.signUpPhoneOtp);
          },
        ),
        SizedBox(height: 25.h),
        const Center(
          child: Text(
            "Or Continue with", 
            style: TextStyle(color: AppColors.subtext, fontSize: 13),
          ),
        ),
        SizedBox(height: 15.h),
        SocialButton(
          label: "Google", 
          icon: Icons.g_mobiledata, 
          iconColor: Colors.red, 
          onTap: () {},
        ),
      ],
    );
  }
}