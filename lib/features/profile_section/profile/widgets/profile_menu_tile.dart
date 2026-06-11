import 'package:fitted/core/theme/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMenuTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String? subtitle;
  final IconData? icon;
  final Widget? trailing;
  final bool showTrailing;

  const ProfileMenuTile({
    super.key,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.icon,
    this.trailing,
    this.showTrailing = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      leading: icon != null
          ? Container(
              width: 36.w,
              height: 36.h,
              decoration: const BoxDecoration(
                color: Colors.white10,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 18.sp),
            )
          : null,
      title: Text(
        title,
        style: FontManager.dmSansH5().copyWith(color: Colors.white),
      ),
      subtitle: subtitle != null
          ? Padding(
              padding: EdgeInsets.only(top: 2.h),
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