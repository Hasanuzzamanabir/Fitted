import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:fitted/core/widgets/custom_text_field.dart';
import 'package:fitted/features/profile_section/support_and_priveacy/provider/security_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SecuritySettingsView extends StatelessWidget {
  const SecuritySettingsView({super.key});
  static const String securitySettingsView = '/securitySettingsView';

  @override
  Widget build(BuildContext context) {
    final securityProvider = Provider.of<SecurityProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: const CustomAppBar(
        title: 'Security',
        leadingImagePath: ImagePath.cross,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Text(
              "Current password",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              hint: "*********",
              prefixIcon: Icons.lock_outline,
              isPassword: securityProvider.isCurrentPasswordHidden,
              fillColor: const Color(0xFF1B1720),
              hintColor: Colors.white30,
              iconColor: Colors.grey.shade400,
              suffixIcon: IconButton(
                onPressed: () => securityProvider.toggleCurrentPassword(),
                icon: Icon(
                  securityProvider.isCurrentPasswordHidden 
                      ? Icons.visibility_off_outlined 
                      : Icons.visibility_outlined,
                  color: Colors.grey.shade400,
                  size: 20,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "New password",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              hint: "*********",
              prefixIcon: Icons.lock_outline,
              isPassword: securityProvider.isNewPasswordHidden,
              fillColor: const Color(0xFF1B1720),
              hintColor: Colors.white30,
              iconColor: Colors.grey.shade400,
              suffixIcon: IconButton(
                onPressed: () => securityProvider.toggleNewPassword(),
                icon: Icon(
                  securityProvider.isNewPasswordHidden 
                      ? Icons.visibility_off_outlined 
                      : Icons.visibility_outlined,
                  color: Colors.grey.shade400,
                  size: 20,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Confirm password",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              hint: "*********",
              prefixIcon: Icons.lock_outline,
              isPassword: securityProvider.isConfirmPasswordHidden,
              fillColor: const Color(0xFF1B1720),
              hintColor: Colors.white30,
              iconColor: Colors.grey.shade400,
              suffixIcon: IconButton(
                onPressed: () => securityProvider.toggleConfirmPassword(),
                icon: Icon(
                  securityProvider.isConfirmPasswordHidden 
                      ? Icons.visibility_off_outlined 
                      : Icons.visibility_outlined,
                  color: Colors.grey.shade400,
                  size: 20,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: AppColors.primecolor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),
            CustomButtonWidget(
              title: "Update password",
              onTap: () {},
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}