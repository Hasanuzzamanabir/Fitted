import 'package:fitted/core/theme/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShareLookBottomSheet extends StatelessWidget {
  const ShareLookBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF131116),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
      ),
      builder: (context) => const ShareLookBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 60.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Share look",
                style: FontManager.playfairH2().copyWith(color: Colors.white, fontSize: 24.sp),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.close_rounded, color: const Color(0xFFFF4B6B), size: 20.sp),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: const Color(0xFF1B1720),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              children: [
                Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    image: const DecorationImage(
                      image: NetworkImage('https://images.unsplash.com/photo-1534528741775-53994a69daeb'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Generated look",
                      style: FontManager.dmSansH3().copyWith(color: Colors.white30, fontSize: 12.sp),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      "Rooftop dinner",
                      style: FontManager.playfairH3().copyWith(color: Colors.white, fontSize: 18.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: const Color(0xFF1B1720),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              children: [
                Icon(Icons.link_rounded, color: Colors.white54, size: 20.sp),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    "https://fitted.app/o/01",
                    style: FontManager.dmSansH3().copyWith(color: Colors.white70, fontSize: 14.sp),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF4B6B),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      "Copy",
                      style: TextStyle(color: Colors.white, fontSize: 11.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF4B6B).withOpacity(0.08),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: const Color(0xFFFF4B6B).withOpacity(0.3)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.file_download_outlined, color: const Color(0xFFFF4B6B), size: 18.sp),
                          SizedBox(width: 6.w),
                          Text("Save Image", style: FontManager.dmSansH3().copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Text("Download to your device", style: TextStyle(color: Colors.white30, fontSize: 10.sp)),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF009688).withOpacity(0.08),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: const Color(0xFF009688).withOpacity(0.3)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.share_outlined, color: const Color(0xFF009688), size: 18.sp),
                          SizedBox(width: 6.w),
                          Text("Share link", style: FontManager.dmSansH3().copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Text("Send via your apps", style: TextStyle(color: Colors.white30, fontSize: 10.sp)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}