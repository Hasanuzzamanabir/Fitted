import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:fitted/features/explore/widgets/check_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/outfit_breakdown_item.dart';
import '../widgets/shop_look_card.dart';
import '../widgets/share_look_bottom_sheet.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});
  static const String exploreView = '/exploreView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: CustomAppBar(
        title: "Saturday · 8pm\nRooftop Dinner",
        //leadingImagePath: ImagePath.cross,
        actionImagePath: ImagePath.save,
        onActionTap: () {
          ShareLookBottomSheet.show(context);
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 80.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Your look for ",
                    style: FontManager.playfairH1().copyWith(color: Colors.white, fontSize: 28.sp),
                  ),
                  TextSpan(
                    text: "Saturday",
                    style: FontManager.playfairH1().copyWith(color: const Color(0xFFFF4B6B), fontSize: 28.sp),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            _buildCoverCard(),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        border: Border.all(color: Colors.red),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_circle_outline, color: Colors.red, size: 16.sp),
                          SizedBox(width: 8.w),
                          Text(
                            "Wear today",
                            style: FontManager.dmSansH3().copyWith(color: Colors.red,fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF4B6B),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.auto_awesome, color: Colors.white, size: 12.sp),
                          SizedBox(width: 8.w),
                          Text(
                            "Try another vibe",
                            style: FontManager.dmSansH3().copyWith(color: Colors.white,fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.h),
            Text(
              "Outfit Breakdown",
              style: FontManager.dmSansH2().copyWith(color: Colors.white, fontSize: 20.sp),
            ),
            SizedBox(height: 16.h),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 20.h,
              childAspectRatio: 0.62,
              children: const [
                OutfitBreakdownItem(
                  imageUrl: 'https://images.unsplash.com/photo-1603252109303-2751441dd157?q=80&w=600&auto=format&fit=crop',
                  brand: "Everlane",
                  description: "Silk Camisole",
                ),
                OutfitBreakdownItem(
                  imageUrl: 'https://images.unsplash.com/photo-1541099649105-f69ad21f3246?q=80&w=600&auto=format&fit=crop',
                  brand: "Reformation",
                  description: "Tailored Wide Leg",
                ),
                OutfitBreakdownItem(
                  imageUrl: 'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?q=80&w=600&auto=format&fit=crop',
                  brand: "Anine Bing",
                  description: "Oversized Blazer",
                ),
                OutfitBreakdownItem(
                  imageUrl: 'https://images.unsplash.com/photo-1614252235316-8c857d38b5f4?q=80&w=600&auto=format&fit=crop',
                  brand: "Gucci",
                  description: "Leather Loafers",
                ),
              ],
            ),
            //SizedBox(height: 20.h),
            Text(
              "Before You Go",
              style: FontManager.dmSansH2().copyWith(color: Colors.white, fontSize: 20.sp),
            ),
            SizedBox(height: 16.h),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF131116),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: Colors.white10),
              ),
              child: const Column(
                children: [
                  ChecklistTile(icon: Icons.layers_outlined, title: "Blotting papers", subtitle: "Humidity-proof your glow"),
                  ChecklistTile(icon: Icons.brush_outlined, title: "Touch-up kit", subtitle: "Berry lip + concealer"),
                  ChecklistTile(icon: Icons.airline_seat_legroom_extra, title: "Backup flats", subtitle: "Slip into ballet flats post-dinner"),
                  ChecklistTile(icon: Icons.opacity, title: "Solid perfume", subtitle: "Re-mist without spilling", showDivider: false),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shop the look",
                  style: FontManager.dmSansH2().copyWith(color: Colors.white, fontSize: 20.sp),
                ),
                Text(
                  "See more",
                  style: FontManager.dmSansH3().copyWith(color: const Color(0xFFFF4B6B), fontSize: 12.sp),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const ShopLookCard(
                    imageUrl: 'https://images.unsplash.com/photo-1596755094514-f87e34085b2c?q=80&w=600&auto=format&fit=crop',
                    brand: "Aimé Leon Dore",
                    title: "Silk-blend shirt, rust",
                    price: "\$245",
                  ),
                  SizedBox(width: 16.w),
                  const ShopLookCard(
                    imageUrl: 'https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?q=80&w=600&auto=format&fit=crop',
                    brand: "Studio Nicholson",
                    title: "Pleated trouser, ink",
                    price: "\$320",
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildCoverCard() {
    return Container(
      height: 400.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1534528741775-53994a69daeb'),
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
            top: 16.h,
            left: 16.w,
            right: 16.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.wb_sunny_outlined, color: const Color(0xFFFF4B6B), size: 12.sp),
                      SizedBox(width: 4.w),
                      Text("Weather rated", style: TextStyle(color: Colors.white, fontSize: 10.sp)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 12.sp),
                      SizedBox(width: 2.w),
                      Text("4.9", style: TextStyle(color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16.h,
            left: 16.w,
            right: 16.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Crimson Rooftop",
                      style: FontManager.playfairH2().copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Smart Casual · Clear evening",
                      style: FontManager.dmSansH3().copyWith(color: Colors.white60, fontSize: 13.sp),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.white10,
                  child: Icon(Icons.bookmark_border_rounded, color: Colors.white, size: 20.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}