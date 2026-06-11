import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpSupportView extends StatelessWidget {
  const HelpSupportView({super.key});
  static const String helpSupportView = '/helpSupportView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: const CustomAppBar(
        title: 'Help & Support',
        leadingImagePath:ImagePath.cross,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              RichText(
                text: TextSpan(
                  text: "Tell us about the ",
                  style: FontManager.playfairH5().copyWith(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                  ),
                  children: [
                    TextSpan(
                      text: "problem or\nsuggestion",
                      style: TextStyle(
                        color: AppColors.primecolor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Fill the information to reach us",
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 32.h),
              Text(
                "Name the Problem or suggestion",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              TextField(
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
                decoration: InputDecoration(
                  hintText: "Type here",
                  hintStyle: TextStyle(color: Colors.white30, fontSize: 14.sp),
                  filled: true,
                  fillColor: const Color(0xFF1B1720),
                  contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                "Detail box",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              TextField(
                maxLines: 7,
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
                decoration: InputDecoration(
                  hintText: "Type here in bit detailed",
                  hintStyle: TextStyle(color: Colors.white30, fontSize: 14.sp),
                  filled: true,
                  fillColor: const Color(0xFF1B1720),
                  contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              CustomButtonWidget(
                title: "Submit",
                onTap: () {},
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}