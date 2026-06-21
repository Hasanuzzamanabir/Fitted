import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:fitted/features/profile_section/sharing_groups/widgets/group_membertile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupSettingsView extends StatefulWidget {
  const GroupSettingsView({super.key});
  static const String groupSettingsView = '/groupSettingsView';

  @override
  State<GroupSettingsView> createState() => _GroupSettingsViewState();
}

class _GroupSettingsViewState extends State<GroupSettingsView> {
  final TextEditingController _groupNameController = TextEditingController();
  int _selectedCoverIndex = 0;

  final List<List<Color>> _coverGradients = [
    [const Color(0xFF9E4B61), const Color(0xFF532431)],
    [const Color(0xFF9E737B), const Color(0xFF53383D)],
    [const Color(0xFF5C755E), const Color(0xFF2B3A2C)],
    [const Color(0xFF5B798A), const Color(0xFF2A3D47)],
    [const Color(0xFF2C2F33), const Color(0xFF141619)],
    [const Color(0xFF8B3A2B), const Color(0xFF451911)],
    [const Color(0xFF8B733A), const Color(0xFF453816)],
    [const Color(0xFF2B5C43), const Color(0xFF122E1F)],
  ];

  @override
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: CustomAppBar(
        title: "Group Settings",
        leadingImagePath: ImagePath.cross,
      ),
    
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 120.h,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                gradient: LinearGradient(
                  colors: _coverGradients[_selectedCoverIndex],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Current Cover",
                    style: TextStyle(color: Colors.white54, fontSize: 11.sp),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "Olivia's Wedding Crew",
                    style: FontManager.playfairH5().copyWith(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            _buildSectionTitle("GROUP NAME"),
            SizedBox(height: 10.h),
            Container(
              height: 52.h,
              decoration: BoxDecoration(
                color: const Color(0xFF1B191E),
                borderRadius: BorderRadius.circular(14.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Center(
                child: TextField(
                  controller: _groupNameController,
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  decoration: InputDecoration(
                    hintText: "e.g. Bali Trip",
                    hintStyle: TextStyle(color: Colors.white24, fontSize: 14.sp),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            _buildSectionTitle("COVER IMAGE (OPTIONAL)"),
            SizedBox(height: 12.h),
            SizedBox(
              height: 36.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _coverGradients.length,
                itemBuilder: (context, index) {
                  bool isSelected = _selectedCoverIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCoverIndex = index;
                      });
                    },
                    child: Container(
                      width: 36.w,
                      margin: EdgeInsets.only(right: 12.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: _coverGradients[index],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: Border.all(
                          color: isSelected ? AppColors.primecolor : Colors.transparent,
                          width: 2.w,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add_photo_alternate_outlined, color: Colors.white54, size: 16.sp),
                  SizedBox(width: 6.w),
                  Text(
                    "UPLOAD CUSTOM IMAGE",
                    style: TextStyle(color: Colors.white54, fontSize: 11.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primecolor.withOpacity(0.8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
                  elevation: 0,
                ),
                onPressed: () {},
                child: Text(
                  'Save Changes',
                  style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(height: 28.h),
            _buildSectionTitle("MANAGE MEMBERS"),
            SizedBox(height: 12.h),
            const GroupMembertile(name: "Olivia (you)", role: "admin", isAdmin: true),
            const GroupMembertile(name: "Mia", role: "member", isAdmin: false),
            const GroupMembertile(name: "Mia", role: "member", isAdmin: false),
            const GroupMembertile(name: "Mia", role: "member", isAdmin: false),
            const GroupMembertile(name: "Mia", role: "member", isAdmin: false),
            SizedBox(height: 24.h),
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
                  _buildSectionTitle("INVITE MEMBERS"),
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
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white38,
        fontSize: 11.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
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