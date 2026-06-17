import 'package:fitted/core/theme/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessAddedDialog extends StatelessWidget {
  const SuccessAddedDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
        backgroundColor: Colors.transparent,
        child: const SuccessAddedDialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF16151A),
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Added",
                style: FontManager.playfairH2().copyWith(color: Colors.white, fontSize: 22.sp),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.close_rounded, color: const Color(0xFFFF4B6B), size: 18.sp),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          const Divider(color: Colors.white10, height: 1),
          SizedBox(height: 32.h),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 120.r,
                  height: 120.r,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF4B6B).withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 100.r,
                  height: 100.r,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFFF4B6B).withOpacity(0.4),
                      width: 2,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Icon(
                  Icons.check_rounded,
                  color: const Color(0xFFFF4B6B),
                  size: 48.sp,
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          Center(
            child: Text(
              "Added new item",
              style: FontManager.playfairH2().copyWith(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Center(
            child: Text(
              "\"Item name\" is now in your wardrobe",
              style: FontManager.dmSansH3().copyWith(
                color: Colors.white30,
                fontSize: 13.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}