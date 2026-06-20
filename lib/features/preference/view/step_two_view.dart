
import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../provider/preference_provider.dart';
import '../widgets/vibe_card.dart';

class StepTwoView extends StatelessWidget {
  const StepTwoView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PreferenceProvider>(context);
    final isWomen = provider.gender == "Women";

    final List<Map<String, String>> vibes = [
      {
        "title": "Streetwear", 
        "subtitle": "Layered, bold, off-duty", 
        "image": isWomen 
            ? "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=600&auto=format&fit=crop"
            : "https://images.unsplash.com/photo-1550246140-5119ae4790b8?q=80&w=600&auto=format&fit=crop"
      },
      {
        "title": "Elevated Casual", 
        "subtitle": "Tailored basics, quiet luxury", 
        "image": isWomen 
            ? "https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=600&auto=format&fit=crop"
            : "https://images.unsplash.com/photo-1617137968427-85924c800a22?q=80&w=600&auto=format&fit=crop"
      },
      {
        "title": "Business Chic", 
        "subtitle": "Sharp, considered, modern", 
        "image": isWomen 
            ? "https://images.unsplash.com/photo-1483985988355-763728e1935b?q=80&w=600&auto=format&fit=crop"
            : "https://images.unsplash.com/photo-1507679799987-c73779587ccf?q=80&w=600&auto=format&fit=crop"
      },
      {
        "title": "Maximalist", 
        "subtitle": "Color, print, statement", 
        "image": isWomen 
            ? "https://images.unsplash.com/photo-1509631179647-0177331693ae?q=80&w=600&auto=format&fit=crop"
            : "https://images.unsplash.com/photo-1534030216700-b45f737c2a41?q=80&w=600&auto=format&fit=crop"
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32.h),
        RichText(
          text: TextSpan(
            text: "What's your ",
            style: FontManager.playfairH5().copyWith(color: Colors.white, fontSize: 32.sp),
            children: [
              TextSpan(text: "default", style: TextStyle(color: AppColors.primecolor)),
              const TextSpan(text: " vibe?"),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "Pick the one that feels most like you. We'll tune from there.", 
          style: TextStyle(color: Colors.white38, fontSize: 13.sp),
        ),
        SizedBox(height: 20.h),

        Container(
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: const Color(0xFF1B191E),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildGenderButton(
                label: "Women",
                isSelected: isWomen,
                onTap: () => provider.setGender("Women"),
              ),
              _buildGenderButton(
                label: "Men",
                isSelected: !isWomen,
                onTap: () => provider.setGender("Men"),
              ),
            ],
          ),
        ),

        SizedBox(height: 24.h),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.82,
            ),
            itemCount: vibes.length,
            itemBuilder: (context, index) {
              final vibe = vibes[index];
              bool isSelected = provider.selectedVibes.contains(vibe["title"]);
              
              return VibeCard(
                title: vibe["title"]!,
                subtitle: vibe["subtitle"]!,
                imageUrl: vibe["image"]!,
                isSelected: isSelected,
                onTap: () => provider.toggleVibe(vibe["title"]!),
              );
            },
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => provider.previousStep(),
                child: const Text("Back", style: TextStyle(color: Colors.white54)),
              ),
            ),
            Expanded(
              child: CustomButtonWidget(
                title: "Next",
                onTap: provider.selectedVibes.isNotEmpty ? () => provider.nextStep() : null,
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),
      ],
    );
  }

  Widget _buildGenderButton({required String label, required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primecolor : Colors.transparent,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade500,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}