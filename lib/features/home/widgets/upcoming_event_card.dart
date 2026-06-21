import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingEventCard extends StatelessWidget {
  final String day;
  final String date;
  final String title;
  final String details;
  final String buttonText;
  final VoidCallback? onButtonTap;

  const UpcomingEventCard({
    super.key,
    required this.day,
    required this.date,
    required this.title,
    required this.details,
    required this.buttonText,
    this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1720),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: const Color(0xFFFF4B6B).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFFFF4B6B).withOpacity(0.4)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  day,
                  style: FontManager.dmSansH3().copyWith(color: const Color(0xFFFF4B6B), fontSize: 10.sp),
                ),
                Text(
                  date,
                  style: FontManager.dmSansH1().copyWith(color: const Color(0xFFFF4B6B), fontSize: 18.sp),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "UPCOMING",
                  style: FontManager.dmSansH3().copyWith(color: Colors.red, fontSize: 10.sp),
                ),
                Text(
                  title,
                  style: FontManager.playfairH3().copyWith(color: Colors.white, fontSize: 16.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  details,
                  style: FontManager.dmSansH3().copyWith(color: Colors.white30, fontSize: 12.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            width: 100.w,
            height: 46.h,
            decoration: BoxDecoration(
              color: const Color(0xFFFF4B6B),
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: CustomButtonWidget(
              //textStyle: FontManager.dmSansH3().copyWith(color: Colors.white),
              title: buttonText,
              onTap: onButtonTap,
            ),
          ),
        ],
      ),
    );
  }
}