import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/today_pick_card.dart';
import '../widgets/upcoming_event_card.dart';
import '../widgets/home_tab_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String homeView = '/homeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 16.w,
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
        padding: EdgeInsets.only(left: 16.w, right: 12.w, bottom: 80.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.h),
            Divider(color: Colors.white, thickness: 1),
            Text(
              "Good morning,",
              style: FontManager.playfairH3().copyWith(color: Colors.white60),
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
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  
    SizedBox(width: 8.w),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline, // 👈 বেসলাইন এলাইনমেন্ট
          textBaseline: TextBaseline.alphabetic, // 👈 এটি অবশ্যই Row-এর প্রোপার্টি হিসেবে থাকবে
          children: [
             Text(
      "⛅",
      style: TextStyle(
        fontSize: 28.sp,
      ),
    ),
            Text(
              "82",
              style: FontManager.dmSansH5().copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                height: 1.0,
              ),
            ),
            Text(
              " °C",
              style: FontManager.dmSansH5().copyWith(
                color: Colors.white,
                fontSize: 14.sp,
                height: 1.0,
              ),
            ),
          ],
        ),
        SizedBox(height: 6.h),
        Text(
          "Partly Cloudy",
          style: FontManager.playfairH3().copyWith(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: Colors.white30,
              size: 14.sp,
            ),
            SizedBox(width: 4.w),
            Text(
              "New York, NY",
              style: FontManager.dmSansH3().copyWith(
                color: Colors.white30,
                fontSize: 12.sp,
              ),
            ),
          ],
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
            _buildResponsiveUpcomingCard(),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeTabButton(
                    label: "+ Plan Outfit",
                    themeColor: const Color(0xFFFF4B6B),
                    onTap: () {
                      Navigator.pushNamed(context, '/planOutfitView');
                    }),
                HomeTabButton(
                    label: "📅 Add Event",
                    themeColor: const Color(0xFF2196F3),
                    onTap: () {
                      Navigator.pushNamed(context, '/calendarView');
                    }),
                HomeTabButton(
                    label: "👕 Wardrobe",
                    themeColor: const Color(0xFF009688),
                    onTap: () {
                      Navigator.pushNamed(context, '/wardrobeView');
                    }),
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

  Widget _buildResponsiveUpcomingCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF131116),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: const Color(0xFF1B1720),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "SAT",
                  style: FontManager.dmSansH3().copyWith(color: Colors.white30, fontSize: 10.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  "07",
                  style: FontManager.playfairH2().copyWith(color: const Color(0xFFFF4B6B), fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "UPCOMING",
                  style: FontManager.dmSansH3().copyWith(color: Colors.white30, fontSize: 10.sp, letterSpacing: 1.2),
                ),
                SizedBox(height: 2.h),
                Text(
                  "Rooftop Di...",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: FontManager.dmSansH2().copyWith(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 2.h),
                Text(
                  "Z Bar · 8:00pm · smart casual",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: FontManager.dmSansH3().copyWith(color: Colors.white30, fontSize: 12.sp),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: const Color(0xFFFF4B6B),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                "Prep Now →",
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: FontManager.dmSansH3().copyWith(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
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