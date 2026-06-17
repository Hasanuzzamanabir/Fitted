import 'package:fitted/core/theme/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WardrobePreviewDialog extends StatelessWidget {
  final String imageUrl;
  final String brand;
  final String description;
  final String tag;

  const WardrobePreviewDialog({
    super.key,
    required this.imageUrl,
    required this.brand,
    required this.description,
    required this.tag,
  });

  static void show(BuildContext context, {
    required String imageUrl,
    required String brand,
    required String description,
    required String tag,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
        backgroundColor: Colors.transparent,
        child: WardrobePreviewDialog(
          imageUrl: imageUrl,
          brand: brand,
          description: description,
          tag: tag,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.85)],
              ),
            ),
          ),
          Positioned(
            top: 16.h,
            right: 16.w,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: CircleAvatar(
                radius: 18.r,
                backgroundColor: Colors.black45,
                child: Icon(Icons.close_rounded, color: Colors.white, size: 18.sp),
              ),
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 20.w,
            right: 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        brand,
                        style: FontManager.playfairH2().copyWith(color: Colors.white, fontSize: 22.sp),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        description,
                        style: FontManager.dmSansH3().copyWith(color: Colors.white60, fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}