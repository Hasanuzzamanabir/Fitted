import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:fitted/features/profile_section/sharing_groups/widgets/group_membertile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MembersView extends StatelessWidget {
  const MembersView({super.key});
  static const String membersView = '/membersView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: const CustomAppBar(
        title: "Members",
        leadingImagePath: ImagePath.cross,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: const Color(0xFF0D0B0E),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Colors.white.withOpacity(0.03), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "INVITE MEMBERS",
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "https://id-preview--037c024a-b2ec-41cd-a508-a2ceceddd76.styled.app/groups/join?code=WED-7821",
                    style: TextStyle(color: Colors.white38, fontSize: 11.sp, height: 1.4),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: _buildInviteButton(
                          label: "Copy Link",
                          icon: Icons.copy,
                          color: const Color(0xFF1B191E),
                          textColor: Colors.white,
                          onTap: () {},
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: _buildInviteButton(
                          label: "Share",
                          icon: Icons.share,
                          color: AppColors.primecolor,
                          textColor: Colors.white,
                          onTap: () {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 28.h),
            Text(
              "5 MEMBERS",
              style: TextStyle(
                color: Colors.white38,
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 12.h),
            const GroupMembertile(name: "Olivia (you)", role: "admin", isAdmin: true),
            const GroupMembertile(name: "Mia", role: "member", isAdmin: false),
            const GroupMembertile(name: "Mia", role: "member", isAdmin: false),
            const GroupMembertile(name: "Mia", role: "member", isAdmin: false),
            const GroupMembertile(name: "Mia", role: "member", isAdmin: false),
          ],
        ),
      ),
    );
  }

  Widget _buildInviteButton({
    required String label,
    required IconData icon,
    required Color color,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: textColor, size: 14.sp),
            SizedBox(width: 8.w),
            Text(
              label,
              style: TextStyle(color: textColor, fontSize: 13.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}