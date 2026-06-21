import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/outfit_post_card.dart';

class MyFitsView extends StatelessWidget {
  const MyFitsView({super.key});
  static const String myFitsView = '/myFitsView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: const CustomAppBar(
        title: "My Fits",
        leadingImagePath: ImagePath.cross,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            Text(
              "SHARED OUTFITS · 2",
              style: TextStyle(
                color: Colors.white38,
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 16.h),
            OutfitPostCard(
              timeAgo: "1 hour ago",
              outfitTitle: "Rehearsal dinner look",
              likes: 2,
              dislikes: 0,
              comments: 2,
              hasImage: true,
              isMyFitsScreen: true,
              imageUrl:
                  "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=600&auto=format&fit=crop",
              onInfoTap: () {},
            ),
            SizedBox(height: 16.h),
            OutfitPostCard(
              timeAgo: "4 hours ago",
              outfitTitle: "Ceremony fit",
              likes: 1,
              dislikes: 0,
              comments: 2,
              hasImage: false,
              isMyFitsScreen: true,
              onInfoTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}