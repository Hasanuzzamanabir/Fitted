import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:fitted/features/profile_section/setting/widgets/custom_toggle_switch.dart';
import 'package:fitted/features/profile_section/subscription/widget/custom_subscription_tile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManageSubscriptionView extends StatefulWidget {
  const ManageSubscriptionView({super.key});
  static const String manageSubscriptionView = '/manageSubscriptionView';

  @override
  State<ManageSubscriptionView> createState() => _ManageSubscriptionViewState();
}

class _ManageSubscriptionViewState extends State<ManageSubscriptionView> {
  bool isAutoRenewEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: const CustomAppBar(
        title: 'Manage subscription',
        leadingImagePath: ImagePath.cross,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFE94C6F),
                    Color(0xFFC0345B),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.workspace_premium, color: Colors.white, size: 16.sp),
                      SizedBox(width: 6.w),
                      Text(
                        "Current plan",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "PURE STYLE · Monthly",
                    style: FontManager.playfairH5().copyWith(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Renews on May 14, 2026 · \$9.99",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2.w),
                        decoration: const BoxDecoration(
                          color: Colors.white24,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.check, color: Colors.white, size: 12.sp),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "All premium features unlocked",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1B1720),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  CustomSubscriptionTile(
                    title: "Auto-renew",
                    subtitle: "Will renew automatically each month",
                    onTap: () {},
                    trailing: CustomToggleSwitch(
                      isRightSelected: isAutoRenewEnabled,
                      onToggle: (value) {
                        setState(() {
                          isAutoRenewEnabled = value;
                        });
                      }, leftLabel: '', rightLabel: '',
                    ),
                  ),
                  const Divider(color: Colors.white10, height: 1),
                  CustomSubscriptionTile(
                    title: "Upgrade to Yearly",
                    subtitle: "Save 50% · \$4.92/mo",
                    onTap: () {},
                    leading: Icon(
                      Icons.workspace_premium_outlined,
                      color: AppColors.primecolor,
                      size: 22.sp,
                    ),
                    trailing: Text(
                      "Switch",
                      style: TextStyle(
                        color: AppColors.primecolor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Divider(color: Colors.white10, height: 1),
                  CustomSubscriptionTile(
                    title: "Cancel subscription",
                    titleColor: AppColors.primecolor,
                    showTrailing: false,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1B1720),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: CustomSubscriptionTile(
                title: "Visa •• 4821",
                subtitle: "Expires 09/28",
                onTap: () {},
                leading: Icon(
                  Icons.credit_card,
                  color: AppColors.primecolor,
                  size: 22.sp,
                ),
                trailing: Text(
                  "Update",
                  style: TextStyle(
                    color: AppColors.primecolor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 28.h),
            Text(
              "BILLING HISTORY",
              style: FontManager.playfairH5().copyWith(
                color: Colors.white54,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1B1720),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  _buildBillingTile("Monthly", "Apr 14, 2026 · INV-204", "\$9.99"),
                  const Divider(color: Colors.white10, height: 1),
                  _buildBillingTile("Monthly", "Mar 14, 2026 · INV-188", "\$9.99"),
                  const Divider(color: Colors.white10, height: 1),
                  _buildBillingTile("Monthly", "Feb 14, 2026 · INV-172", "\$9.99"),
                ],
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildBillingTile(String title, String subtitle, String price) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      title: Text(
        title,
        style: FontManager.dmSansH5().copyWith(color: Colors.white),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 4.h),
        child: Text(
          subtitle,
          style: TextStyle(color: Colors.white38, fontSize: 13.sp),
        ),
      ),
      trailing: Text(
        price,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}