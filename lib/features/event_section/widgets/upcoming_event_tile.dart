import 'package:fitted/core/theme/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingEventTile extends StatelessWidget {
  final String tag;
  final String title;
  final String time;
  final String location;
  final String? rightActionText;
  final String? rightImageUrl;

  const UpcomingEventTile({
    super.key,
    required this.tag,
    required this.title,
    required this.time,
    required this.location,
    this.rightActionText,
    this.rightImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF16151A),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (rightImageUrl != null)
                CircleAvatar(
                  radius: 16.r,
                  backgroundImage: NetworkImage(rightImageUrl!),
                ),
              if (rightActionText != null)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF4B6B),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    rightActionText!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            title,
            style: FontManager.playfairH3().copyWith(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(Icons.access_time, color: Colors.white30, size: 14.sp),
              SizedBox(width: 6.w),
              Text(
                time,
                style: FontManager.dmSansH3().copyWith(color: Colors.white30, fontSize: 12.sp),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(Icons.location_on_outlined, color: Colors.white30, size: 14.sp),
              SizedBox(width: 6.w),
              Text(
                location,
                style: FontManager.dmSansH3().copyWith(color: Colors.white30, fontSize: 12.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}