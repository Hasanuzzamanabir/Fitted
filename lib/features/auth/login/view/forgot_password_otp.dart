import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:fitted/features/auth/login/view/change_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordOtp extends StatelessWidget {
  const ForgotPasswordOtp({super.key});
  static const String forgotPasswordOtp = '/forgotPasswordOtp';

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
                      "Enter the 4-digit code that you receive in your account", 
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

            /// ২. মূল কন্টেন্ট এরিয়া (ব্যাক বাটন, ওটিপি ফিল্ড এবং ভেরিফাই বাটন)
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

                  SizedBox(height: 35.h),

                  /// ইনপুট লেবেল
                  Text(
                    "Verify", 
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 12.h),

                  /// ৪টি ওটিপি বক্সের জন্য রো (Row)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildOtpBox(context, first: true, last: false),
                      _buildOtpBox(context, first: false, last: false),
                      _buildOtpBox(context, first: false, last: false),
                      _buildOtpBox(context, first: false, last: true),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  /// ওটিপি রিকোয়েস্ট মেসেজ / টাইমার
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Didn't receive code? ",
                        style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                        children: [
                          TextSpan(
                            text: "Resend",
                            style: TextStyle(
                              color: AppColors.primecolor, 
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 35.h),

                  /// আপনার নিজস্ব CustomButtonWidget ব্যবহার করা হয়েছে
                  CustomButtonWidget(
                    title: "Verify OTP",
                    onTap: () {
                    Navigator.pushNamed(context, ChangePasswordView.changePasswordView);
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

  /// এক্সট্রা কাস্টম রিইউজেবল ওটিপি ইনপুট বক্স মেথড (অটো-ফোকাস ফিচারসহ)
  Widget _buildOtpBox(BuildContext context, {required bool first, required bool last}) {
    return SizedBox(
      width: 65.w,
      height: 56.h,
      child: TextField(
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus(); // ১টি সংখ্যা লিখলে পরের বক্সে যাবে
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus(); // ডিলিট করলে আগের বক্সে ফিরবে
          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1), // ১ অক্ষরের বেশি লেখা যাবে না
          FilteringTextInputFormatter.digitsOnly, // শুধু নাম্বার সাপোর্ট করবে
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}