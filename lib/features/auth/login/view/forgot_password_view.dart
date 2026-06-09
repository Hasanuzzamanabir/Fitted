import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:fitted/core/widgets/custom_text_field.dart'; // আপনার কাস্টম টেক্সট ফিল্ড পাথ
import 'package:fitted/features/auth/login/view/forgot_password_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static const String forgotPasswordView = '/forgotPasswordView';

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
                      "Forgot Password?", 
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

            /// ২. মূল কন্টেন্ট এরিয়া (ব্যাক বাটন এবং ইনপুট ফর্ম)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),

                  /// কাস্টম ব্যাক বাটন (ইমেজের মতো রাউন্ডেড সাদা কার্ড ডিজাইন)
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

                  SizedBox(height: 35.h),

                  /// ইনপুট লেবেল
                  Text(
                    "Email", 
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  /// আপনার নিজস্ব CustomTextField উইজেট ব্যবহার করা হয়েছে
                  const CustomTextField(
                    hint: "Enter email", 
                    prefixIcon: Icons.email_outlined,
                  ),

                  SizedBox(height: 30.h),

                  /// আপনার নিজস্ব CustomButtonWidget ব্যবহার করা হয়েছে
                 /// আপনার নিজস্ব CustomButtonWidget ব্যবহার করা হয়েছে
CustomButtonWidget(
  title: "Request OTP",
  onTap: () {
    // কোনো ম্যানুয়াল স্ট্রিং ছাড়া সরাসরি ভেরিয়েবলটি কল করুন:
    Navigator.pushNamed(context, ForgotPasswordOtp.forgotPasswordOtp);
  },
),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}