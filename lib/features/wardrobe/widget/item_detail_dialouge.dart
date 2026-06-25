import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/features/wardrobe/widget/success_dialouge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDetailsDialog extends StatefulWidget {
  const ItemDetailsDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        backgroundColor: Colors.transparent,
        child: const ItemDetailsDialog(),
      ),
    );
  }

  @override
  State<ItemDetailsDialog> createState() => _ItemDetailsDialogState();
}

class _ItemDetailsDialogState extends State<ItemDetailsDialog> {
  String selectedCategory = "Sports — Domestic";
  String selectedOccasion = ""; 

  final Map<String, List<String>> allOccasions = {
    "Sports — Domestic": [
      "Derby", "F1", "Super Bowl", "The Masters", "Ryder Cup", 
      "US Open Golf", "Wimbledon", "US Open Tennis", "NBA Finals", "World Cup", 
      "College Football Championship", "Daytona 500", "Preakness", 
      "Belmont Stakes", "March Madness", "NFL Draft", "MLB World Series", 
      "NHL Stanley Cup", "Boxing", "WWE", "UFC"
    ],
    "Sports — International": [
      "Premier League", "Australian Open", "Six Nations Rugby", 
      "Champions League Final", "Cricket World Cup"
    ],
    "Music & Entertainment": [
      "Stadium Concerts", "Coachella", "Lollapalooza", "Glastonbury", 
      "Tomorrowland", "Jazz Festivals", "Country Music Festivals", 
      "Opera", "Broadway", "Comedy Shows", "Award Shows", "BET Awards", "Met Gala"
    ],
    "Cultural & International": [
      "Oktoberfest", "Carnival Rio", "Mardi Gras", "New Year's Eve", 
      "St. Patrick's Day", "Pride Parade", "Running of the Bulls", 
      "Monaco Grand Prix", "Cannes Film Festival", "Fashion Week"
    ],
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
  Widget build(BuildContext context) {
    final currentItems = allOccasions[selectedCategory] ?? [];

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF131116),
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(color: Colors.white10),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Item details",
                  style: FontManager.playfairH2().copyWith(color: Colors.white, fontSize: 22.sp),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close_rounded, color: const Color(0xFFFF4B6B), size: 18.sp),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            _buildImagePreview(),
            SizedBox(height: 20.h),
            _buildLabel("Item tittle"),
            _buildTextField("Type here"),
            SizedBox(height: 16.h),
            _buildLabel("Subline"),
            _buildTextField("Type here"),
            SizedBox(height: 16.h),
            _buildLabel("Suitable for"),
            DropdownButtonFormField<String>(
              dropdownColor: const Color(0xFF1B1720),
              value: selectedCategory,
              icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white54),
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF1B1720),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide.none,
                ),
              ),
              items: allOccasions.keys.map((String key) {
                return DropdownMenuItem<String>(
                  value: key,
                  child: Text(key),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedCategory = value;
                    selectedOccasion = ""; 
                  });
                }
              },
            ),
            SizedBox(height: 20.h),
            Wrap(
              spacing: 10.w,
              runSpacing: 12.h,
              children: currentItems.map((item) {
                final bool isSelected = selectedOccasion == item;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedOccasion = ""; 
                      } else {
                        selectedOccasion = item; 
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFFFF4B6B) : Colors.transparent,
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(
                        color: isSelected ? const Color(0xFFFF4B6B) : Colors.white24,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.white70,
                        fontSize: 13.sp,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 32.h),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePreview() {
    return Container(
      height: 240.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1534528741775-53994a69daeb'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 12.h,
            right: 12.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: const Color(0xFFFF4B6B),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.cached_rounded, color: Colors.white, size: 14.sp),
                  SizedBox(width: 4.w),
                  Text("Change photo", style: TextStyle(color: Colors.white, fontSize: 11.sp, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        label,
        style: FontManager.dmSansH3().copyWith(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white24),
        filled: true,
        fillColor: const Color(0xFF1B1720),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.white),
              ),
              child: Center(
                child: Text("Back", style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          flex: 7,
          child: GestureDetector(
            onTap: selectedOccasion.isEmpty 
                ? null 
                : () {
                    Navigator.pop(context); 
                    SuccessAddedDialog.show(context); 
                  },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                color: selectedOccasion.isEmpty ? const Color(0xFFFF4B6B).withOpacity(0.4) : const Color(0xFFFF4B6B),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text("Save to Wardrobe", style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}