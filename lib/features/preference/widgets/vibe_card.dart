import 'package:fitted/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VibeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final bool isSelected;
  final VoidCallback onTap;

  const VibeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AppColors.primecolor : Colors.transparent,
            width: 2.w,
          ),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.darken,
            ),
          ),
        ),
        padding: EdgeInsets.all(12.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primecolor : Colors.black45,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isSelected ? Icons.check : Icons.add,
                  color: Colors.white,
                  size: 14.sp,
                ),
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}