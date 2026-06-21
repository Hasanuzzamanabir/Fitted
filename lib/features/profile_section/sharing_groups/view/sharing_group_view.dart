import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:fitted/features/profile_section/sharing_groups/view/create_new_group_view.dart';
import 'package:fitted/features/profile_section/sharing_groups/view/group_details_view.dart';
import 'package:fitted/features/profile_section/sharing_groups/view/join_group_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SharingGroupsView extends StatelessWidget {
  const SharingGroupsView({super.key});
  static const String sharingGroupsView = '/sharingGroupsView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: const CustomAppBar(
        title: "Sharing Groups",
        leadingImagePath: ImagePath.cross,
        
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "Style ",
                  style: FontManager.playfairH5().copyWith(
                    color: Colors.white, 
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "together.", 
                      style: TextStyle(color: AppColors.primecolor),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                "Share outfit ideas with friends and decide together.",
                style: TextStyle(color: Colors.white38, fontSize: 13.sp),
              ),
              SizedBox(height: 20.h),
              Container(
                height: 48.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF1B191E),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.white38, size: 18.sp),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                        decoration: InputDecoration(
                          hintText: "Search groups",
                          hintStyle: TextStyle(color: Colors.white24, fontSize: 14.sp),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: _buildActionCard(
                      title: "Create new group",
                      subtitle: "Invite your crew",
                      icon: Icons.add,
                      isPrimary: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CreateGroupView()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: _buildActionCard(
                      title: "Join via link",
                      subtitle: "Paste an invite link",
                      icon: Icons.link,
                      isPrimary: false,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const JoinGroupView()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28.h),
              Text(
                "MY GROUPS · 2",
                style: TextStyle(
                  color: Colors.white38, 
                  fontSize: 11.sp, 
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 12.h),
              _GroupListTile(
                title: "Olivia's Wedding Crew",
                membersCount: 5,
                outfitsCount: 2,
                gradientColors: const [Color(0xFF6B3A47), Color(0xFF3A242B)],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GroupDetailsView()),
                  );
                },
              ),
              _GroupListTile(
                title: "Aspen Ski Trip",
                membersCount: 3,
                outfitsCount: 1,
                gradientColors: const [Color(0xFF456270), Color(0xFF23323A)],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GroupDetailsView()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isPrimary,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120.h,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isPrimary ? const Color(0xFF2B161D) : const Color(0xFF0D0B0E),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isPrimary ? AppColors.primecolor.withOpacity(0.4) : Colors.white.withOpacity(0.05),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 36.r,
              height: 36.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isPrimary ? AppColors.primecolor : const Color(0xFF252327),
              ),
              child: Icon(icon, color: Colors.white, size: 18.sp),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 2.h),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.white38, fontSize: 11.sp),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _GroupListTile extends StatelessWidget {
  final String title;
  final int membersCount;
  final int outfitsCount;
  final List<Color> gradientColors;
  final VoidCallback onTap;

  const _GroupListTile({
    required this.title,
    required this.membersCount,
    required this.outfitsCount,
    required this.gradientColors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: const Color(0xFF0D0B0E),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.white.withOpacity(0.03), width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(Icons.people_outline_rounded, color: Colors.white38, size: 12.sp),
                      SizedBox(width: 4.w),
                      Text(
                        "$membersCount",
                        style: TextStyle(color: Colors.white38, fontSize: 12.sp),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        "$outfitsCount outfits",
                        style: TextStyle(color: Colors.white38, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}