import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:fitted/features/plan_outfit_view/view/outfit_details_form_view.dart';
import 'package:fitted/features/plan_outfit_view/widget/ocassion_group_view.dart';
import 'package:fitted/features/plan_outfit_view/widget/section_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PlanOutfitView extends StatefulWidget {
  const PlanOutfitView({super.key});
  static const String planOutfitView = '/planOutfitView';

  @override
  State<PlanOutfitView> createState() => _PlanOutfitViewState();
}

class _PlanOutfitViewState extends State<PlanOutfitView> {
  String selectedOccasion = "Derby";
  final _searchController = TextEditingController();

  final Map<String, List<String>> mainEvents = {
    "Sports — Domestic": [
      "Derby", "F1", "Super Bowl", "The Masters", "Ryder Cup", 
      "US Open Golf", "US Open Tennis", "NBA Finals", "World Cup", 
      "College Football Championship", "Daytona 500", "Preakness", 
      "Belmont Stakes", "March Madness", "NFL Draft", "MLB World Series", 
      "NHL Stanley Cup", "Boxing", "WWE", "UFC"
    ],
    "Sports — International": [
      "Premier League", "Australian Open", "Six Nations Rugby", 
      "Champions League Final", "Cricket World Cup"
    ],
    "Music & Entertainment": [
      "Stadium Concerts", "Coachella, Lollapalooza", "Glastonbury", 
      "Tomorrowland", "Jazz Festivals", "Country Music Festivals", 
      "Opera", "Broadway", "Comedy Shows", "Award Shows", "BET Awards", "Met Gala"
    ],
    "Cultural & International": [
      "Oktoberfest", "Carnival Rio", "Mardi Gras", "New Year's Eve", 
      "St. Patrick's Day", "Pride Parade", "Running of the Bulls", 
      "Monaco Grand Prix", "Cannes Film Festival", "Fashion Week"
    ]
  };

  final Map<String, List<String>> everyOccasion = {
    "Professional & Career": [
      "Job Interview", "Industry Summit", "Work Event", 
      "Corporate Meeting", "Networking Event", "Business Conference"
    ],
    "Dating & Social": [
      "Date Night", "First Date", "Cocktail Party", "Dinner Party", 
      "Rooftop Brunch", "White Party", "Garden Party", "Watch Party", "Happy Hour"
    ],
    "Casual & Everyday": [
      "Casual Day Out", "Coffee Run", "Shopping Day", 
      "Weekend Hangout", "Errands", "Family Gathering"
    ],
    "Celebrations & Parties": [
      "Birthday Party", "House Party", "Pool Party", 
      "Yacht Party", "Holiday Party", "Graduation Party", "Retirement Party"
    ]
  };

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgprime,
        appBar: const CustomAppBar(
          title: "Plan an Outfit",
          leadingImagePath: ImagePath.cross,
      
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  left: 16.w, 
                  right: 16.w, 
                  top: 180.h, 
                  bottom: 140.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionDivider(label: "THE MAIN EVENT"),
                    ...mainEvents.entries.map((entry) => OccasionGroupView(
                          title: entry.key,
                          items: entry.value,
                          selectedItem: selectedOccasion,
                          onItemSelect: (item) => setState(() => selectedOccasion = item),
                        )),
                    SizedBox(height: 16.h),
                    const SectionDivider(label: "EVERY OCCASION"),
                    ...everyOccasion.entries.map((entry) => OccasionGroupView(
                          title: entry.key,
                          items: entry.value,
                          selectedItem: selectedOccasion,
                          onItemSelect: (item) => setState(() => selectedOccasion = item),
                        )),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                decoration: const BoxDecoration(color: AppColors.bgprime),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Where are you ",
                            style: FontManager.playfairH1().copyWith(color: Colors.white, fontSize: 32.sp),
                          ),
                          TextSpan(
                            text: "headed?",
                            style: FontManager.playfairH1().copyWith(color: const Color(0xFFFF4B6B), fontSize: 32.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Pick an occasion so we can dress you for it",
                      style: FontManager.dmSansH3().copyWith(color: Colors.white30, fontSize: 13.sp),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Search occasions, events, trips...",
                              hintStyle: TextStyle(color: Colors.white24, fontSize: 14.sp),
                              filled: true,
                              fillColor: const Color(0xFF1B1720),
                              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24.r),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Container(
                          padding: EdgeInsets.all(12.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFFFF4B6B).withOpacity(0.3)),
                            color: const Color(0xFFFF4B6B).withOpacity(0.05),
                          ),
                          child: Icon(Icons.add, color: const Color(0xFFFF4B6B), size: 18.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.bgprime.withOpacity(0.0),
                      AppColors.bgprime.withOpacity(0.9),
                      AppColors.bgprime,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFF131116),
                        borderRadius: BorderRadius.circular(24.r),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Selected: ",
                                  style: FontManager.dmSansH3().copyWith(color: Colors.white30, fontSize: 13.sp),
                                ),
                                TextSpan(
                                  text: selectedOccasion,
                                  style: FontManager.dmSansH3().copyWith(
                                    color: const Color(0xFFFF4B6B), 
                                    fontSize: 13.sp, 
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.close_rounded, color: Colors.white30, size: 16.sp),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                CustomButtonWidget(
        title: "Next",
        icon: Icons.arrow_forward_rounded,
        borderRadius: 16.r,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const OutfitDetailsFormView(),
        ),
      );
        },
      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}