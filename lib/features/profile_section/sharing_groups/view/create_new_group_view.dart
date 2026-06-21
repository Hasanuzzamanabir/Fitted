import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../provider/group_provider.dart';

class CreateGroupView extends StatelessWidget {
  const CreateGroupView({super.key});
  static const String createGroupView = '/createGroupView';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GroupProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: const CustomAppBar(
        title: "New Group",
        leadingImagePath: ImagePath.cross,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "GROUP NAME",
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
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
                    controller: provider.groupNameController,
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
              SizedBox(height: 28.h),
              Text(
                "COVER IMAGE (OPTIONAL)",
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 14.h),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: provider.coverGradients.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  bool isSelected = provider.selectedCoverIndex == index;
                  return GestureDetector(
                    onTap: () => provider.selectCover(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        gradient: LinearGradient(
                          colors: provider.coverGradients[index],
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
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add_photo_alternate_outlined,
                      color: Colors.white54,
                      size: 18.sp,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "UPLOAD CUSTOM IMAGE",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 36.h),
              SizedBox(
                width: double.infinity,
                height: 54.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primecolor.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27.r),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () => provider.createGroup(context),
                  child: Text(
                    'Create Group',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}