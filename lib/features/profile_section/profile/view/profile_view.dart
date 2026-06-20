import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:fitted/core/widgets/custom_section_title.dart';
import 'package:fitted/features/profile_section/edit_preference/view/edit_preference_view.dart';
import 'package:fitted/features/profile_section/notification/view/notification.dart';
import 'package:fitted/features/profile_section/profile/view/edit_profile.dart';
import 'package:fitted/features/profile_section/profile/widgets/profile_menu_tile.dart';
import 'package:fitted/features/profile_section/profile/widgets/profile_state_card.dart';
import 'package:fitted/features/profile_section/manage_subscription/view/Manage_subscription_view.dart';
import 'package:fitted/features/profile_section/support_and_priveacy/view/help_and_support.dart';
import 'package:fitted/features/profile_section/support_and_priveacy/view/security.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String profileView = '/profileView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: CustomAppBar(
        title: 'Profile',
        showLeading: false,
        actionImagePath: ImagePath.setting,
        onActionTap: () {
          Navigator.of(context, rootNavigator: true).pushNamed('/settingView');
        },
      ),
      body: SafeArea(
        top: false,
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 80.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 55.r,
                      backgroundImage: const NetworkImage(
                        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=600&auto=format&fit=crop',
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Eleanor",
                      style: FontManager.playfairH1().copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildTag("Minimalist"),
                        SizedBox(width: 8.w),
                        _buildTag("Classic"),
                        SizedBox(width: 8.w),
                        _buildTag("Neutral"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  const Expanded(
                    child: ProfileStatCard(count: "42", label: "Outfits"),
                  ),
                  SizedBox(width: 16.w),
                  const Expanded(
                    child: ProfileStatCard(count: "18", label: "Events"),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              const CustomSectionTitle(title: "Account"),
              SizedBox(height: 12.h),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.black3,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                    ProfileMenuTile(
                      icon: Icons.person_outline,
                      title: "Edit Profile Details",
                      onTap: () {
                        Navigator.pushNamed(context, EditProfileView.editProfileView);
                      },
                    ),
                    const Divider(color: Colors.white10, height: 1),
                    ProfileMenuTile(
                      icon: Icons.accessibility_new_outlined,
                      title: "Edit Style Preferences",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const EditStylePreferencesView()),
                        );
                      },
                    ),
                    const Divider(color: Colors.white10, height: 1),
                    ProfileMenuTile(
                      icon: Icons.accessibility_new_outlined,
                      title: "Outfit sharing groups",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const EditStylePreferencesView()),
                        );
                      },
                    ),
                    const Divider(color: Colors.white10, height: 1),
                    ProfileMenuTile(
                      icon: Icons.credit_card_outlined,
                      title: "Manage Subscription",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ManageSubscriptionView()),
                        );
                      },
                    ),
                    const Divider(color: Colors.white10, height: 1),
                    ProfileMenuTile(
                      icon: Icons.notifications_none_outlined,
                      title: "Notifications",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NotificationsSettingsView()),
                        );
                      },
                    ),
           
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              const CustomSectionTitle(title: "Support & Privacy"),
              SizedBox(height: 12.h),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.black3,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                    ProfileMenuTile(
                      icon: Icons.lock_outline,
                      title: "Security",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SecuritySettingsView()),
                        );
                      },
                    ),
                    const Divider(color: Colors.white10, height: 1),
                    ProfileMenuTile(
                      icon: Icons.headset_mic_outlined,
                      title: "Help & Support",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HelpSupportView()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.primecolor.withAlpha(51),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.primecolor),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}