import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:fitted/core/widgets/custom_social_button.dart';
import 'package:fitted/core/widgets/custom_text_field.dart';
import 'package:fitted/features/auth/signup/view/sign_up_email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../provider/sign_up_tab_provider.dart';

class SignUpEmailForm extends StatelessWidget {
  const SignUpEmailForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<SignUpTabProvider>(context);

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
          "Email", 
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
        ),
        SizedBox(height: 8.h),
        const CustomTextField(
          hint: "Enter email", 
          prefixIcon: Icons.email_outlined,
        ),
        SizedBox(height: 16.h),
        Text(
          "Password", 
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
        ),
        SizedBox(height: 8.h),
        CustomTextField(
          hint: "• • • • • • • •", 
          prefixIcon: Icons.lock_outline, 
          isPassword: authProvider.isPasswordHidden,
          suffixIcon: IconButton(
            onPressed: () => authProvider.togglePasswordVisibility(),
            icon: Icon(
              authProvider.isPasswordHidden 
                  ? Icons.visibility_off_outlined 
                  : Icons.visibility_outlined,
              color: Colors.grey.shade400,
              size: 20,
            ),
          ),
        ),
        SizedBox(height: 24.h),
        CustomButtonWidget(
          title: "Create Account", 
          onTap: () {
            Navigator.pushNamed(context, SignUpEmailOtp.signUpEmailOtp);
          },
        ),
        SizedBox(height: 25.h),
        const Center(
          child: Text(
            "Or Continue with", 
            style: TextStyle(color: AppColors.black2, fontSize: 13),
          ),
        ),
        SizedBox(height: 15.h),
        SocialButton(
          label: "Google", 
          icon: ImagePath.google, 
          onTap: () {},
        ),
      ],
    );
  }
}