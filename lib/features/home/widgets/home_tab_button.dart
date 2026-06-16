import 'package:fitted/core/theme/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTabButton extends StatelessWidget {
  final String label;
  final Color themeColor;
  final VoidCallback? onTap;

  const HomeTabButton({
    super.key,
    required this.label,
    required this.themeColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: themeColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: themeColor.withOpacity(0.3)),
        ),
        child: Text(
          label,
          style: FontManager.dmSansH3().copyWith(
            color: Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}