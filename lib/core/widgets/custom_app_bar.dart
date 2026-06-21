import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? leadingImagePath;
  final VoidCallback? onLeadingTap;
  final String? actionImagePath;
  final VoidCallback? onActionTap;
  final bool showLeading;
  final Color? backgroundColor;
  final Widget? trailingWidget;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leadingImagePath,
    this.onLeadingTap,
    this.actionImagePath,
    this.onActionTap,
    this.showLeading = true,
    this.backgroundColor,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.bgprime,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 24.w,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          showLeading && leadingImagePath != null && leadingImagePath!.isNotEmpty
              ? GestureDetector(
                  onTap: onLeadingTap ?? () => Navigator.pop(context),
                  child: SizedBox(
                    width: 40.w,
                    height: 40.h,
                    child: leadingImagePath!.endsWith('.svg')
                        ? SvgPicture.asset(leadingImagePath!, fit: BoxFit.scaleDown)
                        : Image.asset(leadingImagePath!, fit: BoxFit.scaleDown),
                  ),
                )
              : SizedBox(width: 40.w),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: FontManager.playfairH5().copyWith(color: Colors.white),
            ),
          ),
          trailingWidget ??
              (actionImagePath != null && actionImagePath!.isNotEmpty
                  ? GestureDetector(
                      onTap: onActionTap,
                      child: SizedBox(
                        width: 40.w,
                        height: 40.h,
                        child: actionImagePath!.endsWith('.svg')
                            ? SvgPicture.asset(actionImagePath!, fit: BoxFit.scaleDown)
                            : Image.asset(actionImagePath!, fit: BoxFit.scaleDown),
                      ),
                    )
                  : SizedBox(width: 40.w)),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}