import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:fitted/features/profile_section/sharing_groups/widgets/member_avater_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/outfit_post_card.dart';

class GroupDetailsView extends StatelessWidget {
  const GroupDetailsView({super.key});
  static const String groupDetailsView = '/groupDetailsView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgprime,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(16.w, 70.h, 16.w, 24.h),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF5A2A35), Color(0xFF141216)],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.h),
                      Text(
                        "Group",
                        style: TextStyle(color: Colors.white38, fontSize: 13.sp),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Olivia's Wedding Crew",
                        style: FontManager.playfairH5().copyWith(
                          color: Colors.white,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).pushNamed('/membersView');
                            },
                            child: Row(
                              children: [
                                const MemberAvatarStack(totalMembers: 5),
                                SizedBox(width: 8.w),
                                Text(
                                  "5 members",
                                  style: TextStyle(color: Colors.white54, fontSize: 13.sp),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primecolor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                              elevation: 0,
                            ),
                            onPressed: () => _showShareOutfitDialog(context),
                            icon: Icon(Icons.add, color: Colors.white, size: 14.sp),
                            label: Text(
                              "Share Outfit",
                              style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "SHARED OUTFITS · 2",
                              style: TextStyle(
                                color: Colors.white38,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).pushNamed('/myFitsView');
                              },
                              child: Text(
                                "My Fits",
                                style: TextStyle(
                                  color: AppColors.primecolor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        const OutfitPostCard(
                          authorName: "Olivia",
                          timeAgo: "1 hour ago",
                          outfitTitle: "Rehearsal dinner look",
                          likes: 2,
                          dislikes: 0,
                          comments: 2,
                          hasImage: true,
                          imageUrl: "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=600&auto=format&fit=crop",
                        ),
                        SizedBox(height: 16.h),
                        const OutfitPostCard(
                          authorName: "Mia",
                          timeAgo: "4 hour ago",
                          outfitTitle: "Ceremony fit",
                          likes: 1,
                          dislikes: 0,
                          comments: 2,
                          hasImage: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildHeaderButton(
                      icon: Icons.arrow_back,
                      onTap: () => Navigator.pop(context),
                    ),
                    _buildHeaderButton(
                      icon: Icons.settings_outlined,
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pushNamed('/groupSettingsView');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white10,
        ),
        child: Icon(icon, color: Colors.white, size: 18.sp),
      ),
    );
  }

  void _showShareOutfitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color(0xFF0D0B0E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
            side: BorderSide(color: Colors.white.withOpacity(0.03), width: 1),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10.h),
                Container(
                  width: 56.r,
                  height: 56.r,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF2B161D),
                  ),
                  child: Icon(
                    Icons.checkroom,
                    color: AppColors.primecolor,
                    size: 24.sp,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Paste your outfit link",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 6.h),
                Text(
                  "Get it from your created outfit",
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 12.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B191E),
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Center(
                    child: TextField(
                      style: TextStyle(color: Colors.white, fontSize: 13.sp),
                      decoration: InputDecoration(
                        hintText: "e.g. https://fitted.app/ o/o1",
                        hintStyle: TextStyle(color: Colors.white24, fontSize: 13.sp),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: double.infinity,
                  child: CustomButtonWidget(
                    title: "Share Outfit",
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        );
      },
    );
  }
}