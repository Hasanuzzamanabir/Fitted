import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';

import 'package:fitted/features/profile_section/profile/widgets/profile_menu_tile.dart';
import 'package:fitted/features/profile_section/setting/widgets/custom_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsSettingsView extends StatefulWidget {
  const NotificationsSettingsView({super.key});
  static const String notificationsSettingsView = '/notificationsSettingsView';

  @override
  State<NotificationsSettingsView> createState() => _NotificationsSettingsViewState();
}

class _NotificationsSettingsViewState extends State<NotificationsSettingsView> {
  bool isPushNotificationsEnabled = true;
  bool isEventRemindersEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: const CustomAppBar(
        title: 'Notifications',
          leadingImagePath: ImagePath.cross,
        showLeading: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1B1720),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  ProfileMenuTile(
                    title: "Push Notifications",
                    subtitle: "Outfit Suggestions And Updates",
                    onTap: () {},
                  trailing: CustomToggleSwitch(
                    height: 28.h,
                    width: 50.w,
                      //isSelected: isEventRemindersEnabled,
                      onToggle: (value) {
                        setState(() {
                          isEventRemindersEnabled = value;
                        });
                      }, leftLabel: '', rightLabel: '', isRightSelected:true,
                    ),
                  ),
                  const Divider(color: Colors.white10, height: 1),
                  ProfileMenuTile(
                    title: "Event Reminders",
                    subtitle: "Get Prep Alerts Before Events",
                    onTap: () {},
                    trailing: CustomToggleSwitch(
                      height: 28.h,
                      width: 50.w,
                      //isSelected: isEventRemindersEnabled,
                      onToggle: (value) {
                        setState(() {
                          isEventRemindersEnabled = value;
                        });
                      }, leftLabel: '', rightLabel: '', isRightSelected:true,
                    ),
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