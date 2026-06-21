import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../provider/group_provider.dart';

class JoinGroupView extends StatelessWidget {
  const JoinGroupView({super.key});
  static const String joinGroupView = '/joinGroupView';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GroupProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: const CustomAppBar(
        title: "Join Group",
        leadingImagePath: ImagePath.cross,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),
            Container(
              width: 72.r,
              height: 72.r,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF2B161D),
              ),
              child: Icon(
                Icons.link,
                color: AppColors.primecolor,
                size: 32.sp,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              "Paste your invite link",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              "Get it from whoever invited you.",
              style: TextStyle(
                color: Colors.white38,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 36.h),
            Container(
              height: 54.h,
              decoration: BoxDecoration(
                color: const Color(0xFF1B191E),
                borderRadius: BorderRadius.circular(27.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Center(
                child: TextField(
                  controller: provider.joinLinkController,
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
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              child: CustomButtonWidget(
                title: "Join Group",
                onTap: () => provider.joinGroup(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}