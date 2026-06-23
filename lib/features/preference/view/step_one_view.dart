import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:fitted/features/preference/provider/preference_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class StepOneView extends StatelessWidget {
  const StepOneView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PreferenceProvider>(context);

    // প্রোভাইডারে জেন্ডার নাল থাকলে ড্রপডাউন ভ্যালু নাল থাকবে যেন হিন্ট টেক্সট দেখায়
    // আর যদি অলরেডি সিলেক্টেড থাকে, তবে অবশ্যই তা লিস্টের আইটেমগুলোর একটি হতে হবে
    final String? currentGenderValue = (provider.gender == "Female" || 
            provider.gender == "Male" || 
            provider.gender == "Don't wanna share") 
        ? provider.gender 
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.h),
        RichText(
          text: TextSpan(
            text: "Who are we ",
            style: FontManager.playfairH5().copyWith(
              color: Colors.white,
              fontSize: 32.sp,
              fontWeight: FontWeight.w400,
            ),
            children: [
              TextSpan(
                text: "styling?",
                style: TextStyle(color: AppColors.primecolor),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          "This helps us tailor recommendations.",
          style: TextStyle(color: Colors.white38, fontSize: 14.sp),
        ),
        SizedBox(height: 24.h),
        DropdownButtonFormField<String>(
          dropdownColor: const Color(0xFF1B1720),
          value: currentGenderValue,
          hint: Text("Select gender", style: TextStyle(color: Colors.white30, fontSize: 14.sp)),
          icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white54),
          style: const TextStyle(color: Colors.white),
          items: ["Female", "Male", "Don't wanna share"].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: const TextStyle(color: Colors.white)),
            );
          }).toList(),
          onChanged: (value) => provider.setGender(value!),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF1B1720),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide.none),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          ),
        ),
        SizedBox(height: 32.h),
        Text("Age zone?", style: TextStyle(color: Colors.white70, fontSize: 14.sp)),
        SizedBox(height: 16.h),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 12.h,
          crossAxisSpacing: 12.w,
          childAspectRatio: 2.8,
          children: ["10-17", "18 - 24", "25 - 34", "35 - 44", "45 - 64", "65+"].map((zone) {
            bool isSelected = provider.ageZone == zone;
            return GestureDetector(
              onTap: () => provider.setAgeZone(zone),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primecolor : const Color(0xFF1B1720),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: isSelected ? Colors.white30 : Colors.transparent,
                    width: 1,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(zone, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 32.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Dressing kids",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white24),
              child: Checkbox(
                value: provider.isDressingKids,
                activeColor: AppColors.primecolor,
                checkColor: Colors.white,
                onChanged: (value) {
                  provider.setDressingKids(value!);
                },
              ),
            ),
          ],
        ),
        const Spacer(),
        CustomButtonWidget(
          title: "Next",
          onTap: (currentGenderValue != null && provider.ageZone != null) 
              ? () => provider.nextStep() 
              : null,
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}