import 'package:fitted/core/theme/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodayPickCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String vibeMatch;
  final List<String> avatarUrls;
  final int extraAvatarsCount;
  final VoidCallback? onShopTap;

  const TodayPickCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.vibeMatch,
    required this.avatarUrls,
    this.extraAvatarsCount = 0,
    this.onShopTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
              ),
            ),
          ),
          Positioned(
            bottom: 16.h,
            left: 16.w,
            right: 16.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: FontManager.playfairH2().copyWith(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.red, size: 16.sp),
                          SizedBox(width: 4.w),
                          Text(
                            "$vibeMatch vibe match",
                            style: FontManager.dmSansH3().copyWith(color: Colors.white60),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: (){Navigator.pushNamed(context, '/exploreView');},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ...List.generate(avatarUrls.length, (index) {
                            return SizedBox(
                              width: index == 0 ? 28.r : 18.r,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CircleAvatar(
                                  radius: 14.r,
                                  backgroundImage: NetworkImage(avatarUrls[index]),
                                ),
                              ),
                            );
                          }),
                          if (extraAvatarsCount > 0)
                            SizedBox(
                              width: 18.r,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CircleAvatar(
                                  radius: 14.r,
                                  backgroundColor: const Color(0xFFFF4B6B),
                                  child: Text(
                                    "+$extraAvatarsCount",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    GestureDetector(
                      onTap: onShopTap,
                      child: Row(
                        children: [
                          Text(
                            "Shop this look",
                            style: FontManager.dmSansH3().copyWith(
                              color: const Color(0xFFFF4B6B),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Icon(Icons.shopping_bag_outlined, color: const Color(0xFFFF4B6B), size: 14.sp),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}