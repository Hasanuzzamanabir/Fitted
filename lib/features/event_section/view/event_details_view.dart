
import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:fitted/core/widgets/try_another_vibe_dialouge.dart';
import 'package:fitted/features/explore/widgets/check_list_tile.dart';
import 'package:fitted/features/explore/widgets/share_look_bottom_sheet.dart';
import 'package:fitted/features/explore/widgets/shop_look_card.dart';
import 'package:fitted/features/plan_outfit_view/provider/outfit_recomandation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EventDetailsView extends StatefulWidget {
  final bool isLookGenerated;

  const EventDetailsView({super.key, required this.isLookGenerated});
  static const String eventDetailsView = '/eventDetailsView';

  @override
  State<EventDetailsView> createState() => _EventDetailsViewState();
}

class _EventDetailsViewState extends State<EventDetailsView> {
  late bool hasGeneratedLook;

  @override
  void initState() {
    super.initState();
    hasGeneratedLook = widget.isLookGenerated;
  }

  void showTryAnotherVibeBottomSheet(BuildContext mainContext) {
    showDialog(
      context: mainContext,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.3),
      builder: (context) {
        return TryAnotherVibeDialog(
          onSubmitted: (textValue) {
            mainContext.read<OutfitRecommendationProvider>().regenerateOutfit(textValue);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: CustomAppBar(
        title: "",
        leadingImagePath: ImagePath.cross,
      actionImagePath: ImagePath.save,
        onActionTap: () {
          ShareLookBottomSheet.show(context);
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: const Color(0xFFFF4B6B),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Text(
                hasGeneratedLook ? "Party" : "Work",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              hasGeneratedLook 
                  ? "Gallery Openings: Modern Masters" 
                  : "Q3 Strategy Offsite",
              style: FontManager.playfairH1().copyWith(
                color: Colors.white,
                fontSize: 28.sp,
                height: 1.2,
              ),
            ),
            SizedBox(height: 16.h),
            _buildInfoRow(
              Icons.access_time_rounded, 
              hasGeneratedLook ? "Saturday, May 30 at 7:00 PM" : "Tuesday, June 2 at 9:00 AM"
            ),
            SizedBox(height: 6.h),
            _buildInfoRow(
              Icons.location_on_outlined, 
              hasGeneratedLook ? "Chelsea Arts District" : "Soho House"
            ),
            SizedBox(height: 6.h),
            _buildInfoRow(
              Icons.wb_sunny_outlined, 
              hasGeneratedLook ? "65° • Clear Evening" : "72° • Sunny"
            ),
            SizedBox(height: 20.h),
            if (hasGeneratedLook) ...[
              _buildMainCoverCard(),
              SizedBox(height: 20.h),
              _buildActionButtons(),
            ] else ...[
              _buildAIRecommendationCard(),
            ],
            SizedBox(height: 32.h),
            Text(
              "Survival kit",
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
            if (hasGeneratedLook) ...[
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
                      imageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
                      brand: "Aimé Leon Dore",
                      title: "Silk-blend shirt, rust",
                      price: "\$245",
                    ),
                    SizedBox(width: 16.w),
                    const ShopLookCard(
                      imageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
                      brand: "Studio Nicholson",
                      title: "Pleated trouser, ink",
                      price: "\$320",
                    ),
                  ],
                ),
              ),
            ],
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white30, size: 16.sp),
        SizedBox(width: 8.w),
        Text(
          text,
          style: FontManager.dmSansH3().copyWith(color: Colors.white60, fontSize: 13.sp),
        ),
      ],
    );
  }

  Widget _buildAIRecommendationCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFF4B6B).withOpacity(0.05),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFFF4B6B).withOpacity(0.15)),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: const Color(0xFFFF4B6B).withOpacity(0.15),
            child: Icon(Icons.science_outlined, color: const Color(0xFFFF4B6B), size: 28.sp),
          ),
          SizedBox(height: 16.h),
          Text(
            "Generate Look",
            style: FontManager.playfairH2().copyWith(color: Colors.white, fontSize: 20.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            "Let AI style you based on the\nweather, location, and dress code.",
            textAlign: TextAlign.center,
            style: FontManager.dmSansH3().copyWith(color: Colors.white30, fontSize: 13.sp, height: 1.4),
          ),
          SizedBox(height: 24.h),
          GestureDetector(
            onTap: () {
              setState(() {
                hasGeneratedLook = true;
              });
            },
            child: Container(
              width: 160.w,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                color: const Color(0xFFFF4B6B),
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF4B6B).withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Center(
                child: Text(
                  "Style Me",
                  style: FontManager.dmSansH3().copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainCoverCard() {
    final List<String> avatars = [
      'https://placeholder.com/150',
      'https://placeholder.com/150',
    ];

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
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...List.generate(avatars.length, (index) {
                      return SizedBox(
                        width: index == 0 ? 28.r : 18.r,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            radius: 14.r,
                            backgroundImage: NetworkImage(avatars[index]),
                          ),
                        ),
                      );
                    }),
                    SizedBox(
                      width: 18.r,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          radius: 14.r,
                          backgroundColor: const Color(0xFFFF4B6B),
                          child: Text(
                            "+2",
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

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color:AppColors.primecolor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_outline, color: AppColors.primecolor, size: 16.sp),
                SizedBox(width: 8.w),
                Text(
                  "Wear today",
                  style: FontManager.dmSansH3().copyWith(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w600),
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
                    style: FontManager.dmSansH3().copyWith(
                      color: Colors.white, 
                      fontSize: 12.sp, 
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}