import 'package:fitted/core/theme/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionDivider extends StatelessWidget {
  final String label;

  const SectionDivider({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        children: [
          Expanded(child: Container(height: 1, color: Colors.white10)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              label,
              style: FontManager.dmSansH3().copyWith(
                color: Colors.white24,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
          Expanded(child: Container(height: 1, color: Colors.white10)),
        ],
      ),
    );
  }
}