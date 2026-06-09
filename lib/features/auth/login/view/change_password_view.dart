import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:fitted/core/widgets/custom_text_field.dart';   // আপনার কাস্টম টেক্সট ফিল্ড পাথ
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
  static const String changePasswordView = '/changePasswordView';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.bgSecondary, // আপনার ক্রিম ব্যাকগ্রাউন্ড কালার
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ১. ডার্ক হেডার এরিয়া (ইমেজ ব্যাকগ্রাউন্ড এবং টাইটেল)
            Container(
              width: double.infinity,
              height: size.height * 0.28,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImagePath.appbarimage), 
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35.r),
                  bottomRight: Radius.circular(35.r),
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.5),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35.r),
                    bottomRight: Radius.circular(35.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Fitted.", 
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 32.sp, 
                        fontWeight: FontWeight.bold, 
                        fontFamily: 'Serif',
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Change Password?", 
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 22.sp, 
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "Use the same mail that you used to create the account", 
                      style: TextStyle(
                        color: Colors.white70, 
                        fontSize: 13.sp,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// ২. মূল কন্টেন্ট এরিয়া
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),

                  /// কাস্টম ব্যাক বাটন
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.arrow_back, size: 16.sp, color: Colors.black87),
                          SizedBox(width: 6.w),
                          Text(
                            "Back",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 25.h),

                  /// New Password ফিল্ড
                  Text(
                    "New Password", 
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black87),
                  ),
                  SizedBox(height: 8.h),
                  const CustomTextField(
                    hint: "Something secure", 
                    prefixIcon: Icons.lock_outline,
                    isPassword: true,
                  ),

                  SizedBox(height: 16.h),

                  /// Confirm Password ফিল্ড
                  Text(
                    "Confirm Password", 
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black87),
                  ),
                  SizedBox(height: 8.h),
                  const CustomTextField(
                    hint: "Confirm your password", 
                    prefixIcon: Icons.lock_outline,
                    isPassword: true,
                  ),

                  SizedBox(height: 20.h),

                  /// ৩. পাসওয়ার্ড রুলস বক্স (ইমেজের মতো বর্ডার এবং গ্রিন টিক মার্কসহ)
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(color: const Color(0xFFFFD4D9)), // হালকা পিঙ্ক বর্ডার
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password must contain:",
                          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, color: Colors.grey.shade700),
                        ),
                        SizedBox(height: 12.h),
                        _buildRequirementItem("At least 8 characters"),
                        _buildRequirementItem("Contains uppercase letter"),
                        _buildRequirementItem("Contains lowercase letter"),
                        _buildRequirementItem("Contains number"),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.h),

                  /// আপনার নিজস্ব CustomButtonWidget ব্যবহার করা হয়েছে
                  CustomButtonWidget(
                    title: "Reset Password",
                    onTap: () {
                      // পাসওয়ার্ড রিসেট করার এপিআই লজিক এখানে হবে
                    },
                  ),

                  SizedBox(height: 20.h),

                  /// ব্যাক টু লগইন টেক্সট বাটন
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // আপনার লগইন স্ক্রিনের রুটে ব্যাক করার জন্য
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Back to ",
                          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                          children: [
                            TextSpan(
                              text: "Login",
                              style: TextStyle(
                                color: AppColors.primecolor, 
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// পাসওয়ার্ড রিকোয়ারমেন্ট রো আইটেম মেথড
  Widget _buildRequirementItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_outline, 
            size: 16.sp, 
            color: const Color(0xFF00CFA5), // ইমেজের সেই গ্রিন কালার টিকমার্ক
          ),
          SizedBox(width: 8.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 12.sp, 
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}