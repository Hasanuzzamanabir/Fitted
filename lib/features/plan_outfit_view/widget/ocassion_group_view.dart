import 'package:fitted/core/theme/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OccasionGroupView extends StatelessWidget {
  final String title;
  final List<String> items;
  final String selectedItem;
  final Function(String) onItemSelect;

  const OccasionGroupView({
    super.key,
    required this.title,
    required this.items,
    required this.selectedItem,
    required this.onItemSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 12.h, top: 8.h),
          child: Text(
            title,
            style: FontManager.dmSansH2().copyWith(color: Colors.white, fontSize: 18.sp),
          ),
        ),
        Wrap(
          spacing: 8.w,
          runSpacing: 10.h,
          children: items.map((item) {
            final bool isSelected = selectedItem == item;
            return GestureDetector(
              onTap: () => onItemSelect(item),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFFF4B6B) : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: isSelected ? const Color(0xFFFF4B6B) : Colors.white10,
                  ),
                ),
                child: Text(
                  item,
                  style: FontManager.dmSansH3().copyWith(
                    color: isSelected ? Colors.white : Colors.white70,
                    fontSize: 13.sp,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}