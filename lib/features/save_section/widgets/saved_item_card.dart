import 'package:fitted/core/theme/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedItemCard extends StatelessWidget {
  final String imageUrl;
  final String brand;
  final String description;
  final VoidCallback? onBookmarkTap;

  const SavedItemCard({
    super.key,
    required this.imageUrl,
    required this.brand,
    required this.description,
    this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10.h,
                right: 10.w,
                child: GestureDetector(
                  onTap: onBookmarkTap,
                  child: CircleAvatar(
                    radius: 14.r,
                    backgroundColor: const Color(0xFFFF4B6B).withOpacity(0.85),
                    child: Icon(
                      Icons.bookmark_rounded,
                      color: Colors.white,
                      size: 14.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          brand,
          style: FontManager.dmSansH3().copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          description,
          style: FontManager.dmSansH3().copyWith(
            color: Colors.white30,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}