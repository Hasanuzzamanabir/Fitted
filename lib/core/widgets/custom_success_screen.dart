import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSuccessScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonTitle;
  final VoidCallback onButtonTap;

  const CustomSuccessScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonTitle,
    required this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath.appbarimage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              width: 120.w,
              height: 120.h,
              decoration: const BoxDecoration(
                color: AppColors.primecolor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 60.sp,
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primecolor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            CustomButtonWidget(
              title: buttonTitle,
              onTap: onButtonTap,
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}