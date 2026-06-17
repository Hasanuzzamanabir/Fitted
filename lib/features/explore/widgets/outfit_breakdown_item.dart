import 'package:fitted/core/theme/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutfitBreakdownItem extends StatelessWidget {
  final String imageUrl;
  final String brand;
  final String description;
  final VoidCallback? onTap;

  const OutfitBreakdownItem({
    super.key,
    required this.imageUrl,
    required this.brand,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
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
      ),
    );
  }
}