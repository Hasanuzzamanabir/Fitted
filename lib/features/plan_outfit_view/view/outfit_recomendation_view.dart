
import 'dart:ui';
import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:fitted/features/bottom_nav_bar/view/bottom_nav_bar_view.dart';
import 'package:fitted/features/explore/widgets/outfit_breakdown_item.dart';
import 'package:fitted/features/explore/widgets/share_look_bottom_sheet.dart';
import 'package:fitted/features/explore/widgets/shop_look_card.dart';
import 'package:fitted/features/plan_outfit_view/provider/outfit_recomandation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../explore/widgets/check_list_tile.dart'; 

class OutfitRecommendationView extends StatelessWidget {
  const OutfitRecommendationView({super.key});
  static const String outfitRecommendationView = '/outfitRecommendationView';

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OutfitRecommendationProvider>();

    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: CustomAppBar(
        title: "Plan an Outfit",
        leadingImagePath: ImagePath.cross,
        actionImagePath: ImagePath.save,
        onActionTap: () {
          ShareLookBottomSheet.show(context);
        },
        onLeadingTap: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            BottomNavBarView.bottomNavBarView,
            (route) => false,
          );
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 80.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            GestureDetector(
              onTap: () => context.read<OutfitRecommendationProvider>().toggleExpanded(),
              child: _buildMainCoverCard(provider.currentCoverImage),
            ),
            SizedBox(height: 20.h),
            _buildActionButtons(context),
            if (provider.isExpanded) ...[
              SizedBox(height: 32.h),
              Text(
                "Outfit Breakdown",
                style: FontManager.playfairH2().copyWith(color: Colors.white, fontSize: 20.sp),
              ),
              SizedBox(height: 16.h),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: provider.breakdownItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 20.h,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final item = provider.breakdownItems[index];
                  return OutfitBreakdownItem(
                    imageUrl: item["image"]!,
                    brand: item["brand"]!,
                    description: item["title"]!,
                  );
                },
              ),
            ],
            SizedBox(height: 32.h),
            Text(
              "Survival kit",
              style: FontManager.playfairH2().copyWith(color: Colors.white, fontSize: 20.sp),
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
                  style: FontManager.playfairH2().copyWith(color: Colors.white, fontSize: 20.sp),
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

  Widget _buildMainCoverCard(String coverImage) {
    return Container(
      height: 400.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        image: DecorationImage(
          image: NetworkImage(coverImage),
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
                colors: [Colors.transparent, Colors.black.withOpacity(0.75)],
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
                      Icon(Icons.auto_awesome, color: const Color(0xFFFF4B6B), size: 12.sp),
                      SizedBox(width: 4.w),
                      Text("AI Styled", style: TextStyle(color: Colors.white, fontSize: 10.sp)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text("94% style match", style: TextStyle(color: Colors.white, fontSize: 10.sp)),
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
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF4B6B),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        "Casual",
                        style: TextStyle(color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 24.r,
                      width: 60.w,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            child: CircleAvatar(radius: 12.r, backgroundImage: const NetworkImage('https://placeholder.com/150')),
                          ),
                          Positioned(
                            left: 16.w,
                            child: CircleAvatar(radius: 12.r, backgroundImage: const NetworkImage('https://placeholder.com/150')),
                          ),
                          Positioned(
                            left: 32.w,
                            child: CircleAvatar(
                              radius: 12.r,
                              backgroundColor: const Color(0xFFFF4B6B),
                              child: Text("+2", style: TextStyle(color: Colors.white, fontSize: 9.sp, fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
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

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color: AppColors.primecolor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_outline, color: AppColors.primecolor, size: 14.sp),
                SizedBox(width: 8.w),
                Text(
                  "Wear today",
                  style: FontManager.dmSansH3().copyWith(color: AppColors.primecolor, fontSize: 12.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: GestureDetector(
            onTap: () => showTryAnotherVibeBottomSheet(context),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                color: AppColors.primecolor,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.auto_awesome, color: Colors.white, size: 12.sp),
                  SizedBox(width: 8.w),
                  Text(
                    "Try another vibe",
                    style: FontManager.dmSansH3().copyWith(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void showTryAnotherVibeBottomSheet(BuildContext mainContext) {
    final TextEditingController changeController = TextEditingController();

    showDialog(
      context: mainContext,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.3),
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            backgroundColor: const Color(0xFF1B191E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            contentPadding: EdgeInsets.all(20.w),
            insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What’s the change you need in the outfit?",
                  style: FontManager.dmSansH2().copyWith(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  height: 140.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF25232A),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: TextField(
                    controller: changeController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                    decoration: InputDecoration(
                      hintText: "Type here in bit details",
                      hintStyle: TextStyle(
                        color: Colors.white30,
                        fontSize: 14.sp,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      mainContext.read<OutfitRecommendationProvider>().regenerateOutfit(changeController.text);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF4B6B),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Try the vibe",
                          style: FontManager.dmSansH3().copyWith(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Icon(
                          Icons.auto_awesome,
                          color: Colors.white,
                          size: 14.sp,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}