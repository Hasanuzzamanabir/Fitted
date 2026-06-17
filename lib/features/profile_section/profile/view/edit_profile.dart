import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:fitted/core/widgets/custom_text_field.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});
  static const String editProfileView = '/editProfileView';
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF120E16),
      appBar: const CustomAppBar(
        title: 'Edit profile details',
        leadingImagePath: ImagePath.cross,
        showLeading: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h), 
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60.r,
 backgroundImage: const NetworkImage(
                        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=600&auto=format&fit=crop',
                      ),                  ),
                  Positioned(
                    bottom: 0,
                    right: 4.w,
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF4B6B),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "First Name",
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
                          hint: "First name",
                          prefixIcon: Icons.person_outline,
                        ),
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
                          hint: "Last name",
                          prefixIcon: Icons.person_outline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              "Email",
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
                hint: "Enter email",
                prefixIcon: Icons.mail_outline,
              ),
            ),
            SizedBox(height: 40.h),
            CustomButtonWidget(
              title: "Save changes",
              onTap: () {},
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}