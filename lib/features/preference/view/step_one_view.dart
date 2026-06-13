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
          value: provider.gender,
          hint: Text("Select gender", style: TextStyle(color: Colors.white30, fontSize: 14.sp)),
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
          ),
        ),
        SizedBox(height: 32.h),
        Text("Age zone?", style: TextStyle(color: Colors.white70, fontSize: 14.sp)),
        SizedBox(height: 16.h),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 12.h,
          crossAxisSpacing: 12.w,
          childAspectRatio: 2.8,
          children: ["18 - 24", "25 - 34", "35 - 44", "45+"].map((zone) {
            bool isSelected = provider.ageZone == zone;
            return GestureDetector(
              onTap: () => provider.setAgeZone(zone),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primecolor : const Color(0xFF1B1720),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                alignment: Alignment.center,
                child: Text(zone, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
              ),
            );
          }).toList(),
        ),
        const Spacer(),
        CustomButtonWidget(
          title: "Next",
          onTap: (provider.gender != null && provider.ageZone != null) ? () => provider.nextStep() : null,
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}