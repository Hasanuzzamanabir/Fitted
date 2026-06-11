import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:fitted/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecuritySettingsView extends StatelessWidget {
  const SecuritySettingsView({super.key});
  static const String securitySettingsView = '/securitySettingsView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: const CustomAppBar(
        title: 'Security',
        leadingImagePath: 'assets/icons/cross.svg',
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
            Theme(
              data: Theme.of(context).copyWith(
                inputDecorationTheme: InputDecorationTheme(
                  fillColor: const Color(0xFF1B1720),
                  hintStyle: TextStyle(color: Colors.white30, fontSize: 14.sp),
                ),
              ),
              child: const CustomTextField(
                hint: "*********",
                prefixIcon: Icons.lock_outline,
                isPassword: true,
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
            Theme(
              data: Theme.of(context).copyWith(
                inputDecorationTheme: InputDecorationTheme(
                  fillColor: const Color(0xFF1B1720),
                  hintStyle: TextStyle(color: Colors.white30, fontSize: 14.sp),
                ),
              ),
              child: const CustomTextField(
                hint: "*********",
                prefixIcon: Icons.lock_outline,
                isPassword: true,
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
            Theme(
              data: Theme.of(context).copyWith(
                inputDecorationTheme: InputDecorationTheme(
                  fillColor: const Color(0xFF1B1720),
                  hintStyle: TextStyle(color: Colors.white30, fontSize: 14.sp),
                ),
              ),
              child: const CustomTextField(
                hint: "*********",
                prefixIcon: Icons.lock_outline,
                isPassword: true,
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