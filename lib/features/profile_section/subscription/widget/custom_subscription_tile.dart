import 'package:fitted/core/theme/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSubscriptionTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final bool showTrailing;
  final Color? titleColor;

  const CustomSubscriptionTile({
    super.key,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.leading,
    this.trailing,
    this.showTrailing = true,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      leading: leading,
      title: Text(
        title,
        style: FontManager.dmSansH5().copyWith(color: titleColor ?? Colors.white),
      ),
      subtitle: subtitle != null
          ? Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Text(
                subtitle!,
                style: TextStyle(color: Colors.white38, fontSize: 12.sp),
              ),
            )
          : null,
      trailing: showTrailing
          ? (trailing ??
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white30,
                size: 14.sp,
              ))
          : null,
    );
  }
}