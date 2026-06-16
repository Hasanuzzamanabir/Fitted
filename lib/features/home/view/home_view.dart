import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/today_pick_card.dart';
import '../widgets/upcoming_event_card.dart';
import '../widgets/home_tab_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Fitted.',
          style: FontManager.playfairH2().copyWith(
            color: Colors.white,
            fontSize: 28.sp,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: CircleAvatar(
              backgroundColor: const Color(0xFF211D26),
              radius: 20.r,
              child: Icon(
                Icons.notifications_none_rounded,
                color: Colors.white,
                size: 20.sp,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 80.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Text(
              "Good morning,",
              style: FontManager.dmSansH3().copyWith(color: Colors.white60),
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Eleanor",
                  style: FontManager.playfairH1().copyWith(
                    color: const Color(0xFFFF4B6B),
                    fontSize: 36.sp,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.wb_cloudy_outlined, color: Colors.amber, size: 24.sp),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "82°",
                          style: FontManager.dmSansH5().copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Partly Cloudy\nNew York, NY",
                          style: FontManager.dmSansH3().copyWith(
                            color: Colors.white30,
                            fontSize: 10.sp,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Text(
              "Three events. One wardrobe.",
              style: FontManager.dmSansH3().copyWith(color: Colors.white30),
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's pick for you",
                  style: FontManager.dmSansH2().copyWith(color: Colors.white),
                ),
                Row(
                  children: [
                    Icon(Icons.auto_awesome, color: const Color(0xFFFF4B6B), size: 14.sp),
                    SizedBox(width: 4.w),
                    Text(
                      "AI styled",
                      style: FontManager.dmSansH3().copyWith(
                        color: const Color(0xFFFF4B6B),
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12.h),
            const TodayPickCard(
              imageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
              title: "Crimson Rooftop",
              vibeMatch: "4.9",
              avatarUrls: [
                'https://placeholder.com/150',
                'https://placeholder.com/150',
              ],
              extraAvatarsCount: 2,
            ),
            SizedBox(height: 16.h),
            const UpcomingEventCard(
              day: "SAT",
              date: "07",
              title: "Rooftop Di...",
              details: "Z Bar · 8:00pm · smart casual",
              buttonText: "Prep Now →",
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeTabButton(label: "+ Plan Outfit", themeColor: const Color(0xFFFF4B6B), onTap: () {}),
                HomeTabButton(label: "📅 Add Event", themeColor: const Color(0xFF2196F3), onTap: () {}),
                HomeTabButton(label: "👕 Wardrobe", themeColor: const Color(0xFF009688), onTap: () {}),
              ],
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Looks",
                  style: FontManager.dmSansH2().copyWith(color: Colors.white),
                ),
                Text(
                  "View all",
                  style: FontManager.dmSansH3().copyWith(
                    color: const Color(0xFFFF4B6B),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(child: _buildRecentLookItem('https://images.unsplash.com/photo-1580489944761-15a19d654956', "Client Pitch", "Work")),
                SizedBox(width: 12.w),
                Expanded(child: _buildRecentLookItem('https://images.unsplash.com/photo-1544005313-94ddf0286df2', "Sunday meal", "Brunch")),
              ],
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentLookItem(String imgUrl, String title, String category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 220.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            image: DecorationImage(
              image: NetworkImage(imgUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          title,
          style: FontManager.dmSansH3().copyWith(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        Text(
          category,
          style: FontManager.dmSansH3().copyWith(color: Colors.white30, fontSize: 12.sp),
        ),
      ],
    );
  }
}