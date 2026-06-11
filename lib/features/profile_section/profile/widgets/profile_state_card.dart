import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileStatCard extends StatelessWidget {
  final String count;
  final String label;

  const ProfileStatCard({
    super.key,
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColors.primecolor.withAlpha(25), // 0.1 * 255
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color:AppColors.border), // 0.2 * 255
      ),
      child: Column(
        children: [
          Text(
            count,
            style: FontManager.playfairH1().copyWith(color: Colors.white),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style:FontManager.playfairH5().copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}