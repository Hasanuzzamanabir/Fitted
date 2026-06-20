import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PremiumHeader extends StatelessWidget {
  const PremiumHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        SizedBox(height: 20.h),
        Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 34.r,
                backgroundColor: const Color(0xFFFF4B6B),
                child: Icon(
                  Icons.auto_awesome,
                  color: Colors.white,
                  size: 34.sp,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "Pure Style",
                style: TextStyle(
                  color: const Color(0xFFFF4B6B),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Become a Style Pro",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "Unlock personalized fashion recommendations, wardrobe insights, and exclusive styling tools tailored to your taste.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14.sp,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}