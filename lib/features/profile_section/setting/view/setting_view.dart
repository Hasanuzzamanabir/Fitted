import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:fitted/core/widgets/custom_section_title.dart';
import 'package:fitted/features/profile_section/profile/view/edit_profile.dart';
import 'package:fitted/features/profile_section/profile/widgets/profile_menu_tile.dart';
import 'package:fitted/features/profile_section/setting/widgets/custom_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});
  static const String settingView = '/settingView';

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar:CustomAppBar(
        title: 'Setting',
        showLeading: true,
        leadingImagePath: ImagePath.cross,
        onLeadingTap: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
             CustomSectionTitle(title: "Account"),
             SizedBox(height: 12.h),
              
            
           Container(
                decoration: BoxDecoration(
                  color: AppColors.black3, // 0.1 * 255
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                   
                    ProfileMenuTile(icon: Icons.lock_outline, title: "Terms of service", onTap: () {
                      // Navigator.pushNamed(context, '/editProfileView');
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfileView()));
                    },trailing: CustomToggleSwitch(leftLabel: "Off", rightLabel: "On", isRightSelected: true, onToggle: (val) {}),),
                    const Divider(color: Colors.white10, height: 1),
                    ProfileMenuTile(icon: Icons.headset_mic_outlined, title: "Privacy policy", onTap: () {},trailing:Text("English(US)", style: TextStyle(color: Colors.white54, fontSize: 14.sp),) ,),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
             CustomSectionTitle(title: "Account"),
             SizedBox(height: 12.h),
              
            
           Container(
                decoration: BoxDecoration(
                  color: AppColors.black3, // 0.1 * 255
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                   
                    ProfileMenuTile(icon: Icons.lock_outline, title: "Terms of service", onTap: () {}),
                    const Divider(color: Colors.white10, height: 1),
                    ProfileMenuTile(icon: Icons.headset_mic_outlined, title: "Privacy policy", onTap: () {}),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
            CustomButtonWidget(title:   "Logout", onTap: () {
        Navigator.pushNamed(context, '/logintabscreen');
            }),
          ],
        ),
      ),
      
    );
  }
}