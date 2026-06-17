import 'package:fitted/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key, 
    required this.title, 
    this.onTap,
    this.icon,
    this.borderRadius,
    this.padding,
  });

  final String title;
  final void Function()? onTap;
  final IconData? icon;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          color: AppColors.primecolor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xffFFFFFF), 
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (icon != null) ...[
                SizedBox(width: 6.w),
                Icon(icon, color: Colors.white, size: 16.sp),
              ],
            ],
          ),
        ),
      ),
    );
  }
}