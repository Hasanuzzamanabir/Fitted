// import 'package:fitted/core/theme/app_colors.dart';
// import 'package:fitted/core/theme/font_manager.dart';
// import 'package:fitted/core/widgets/custom_button_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import '../provider/preference_provider.dart';
// import '../widgets/vibe_card.dart';

// class StepTwoView extends StatelessWidget {
//   const StepTwoView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<PreferenceProvider>(context);

//     final List<Map<String, String>> vibes = [
//       {"title": "Streetwear", "subtitle": "Layered, bold, off-duty", "image": "https://picsum.photos/200/300"},
//       {"title": "Elevated Casual", "subtitle": "Tailored basics, quiet luxury", "image": "https://picsum.photos/200/301"},
//       {"title": "Business Chic", "subtitle": "Sharp, considered, modern", "image": "https://picsum.photos/200/302"},
//       {"title": "Maximalist", "subtitle": "Color, print, statement", "image": "https://picsum.photos/200/303"},
//     ];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: 32.h),
//         RichText(
//           text: TextSpan(
//             text: "What's your ",
//             style: FontManager.playfairH5().copyWith(color: Colors.white, fontSize: 32.sp),
//             children: [
//               TextSpan(text: "default", style: TextStyle(color: AppColors.primecolor)),
//               const TextSpan(text: " vibe?"),
//             ],
//           ),
//         ),
//         SizedBox(height: 8.h),
//         Text(
//           "Pick the ones that feel most like you (multiple selection).", 
//           style: TextStyle(color: Colors.white38, fontSize: 13.sp),
//         ),
//         SizedBox(height: 24.h),
//         Expanded(
//           child: GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 16.w,
//               mainAxisSpacing: 16.h,
//               childAspectRatio: 0.85,
//             ),
//             itemCount: vibes.length,
//             itemBuilder: (context, index) {
//               final vibe = vibes[index];
//               bool isSelected = provider.selectedVibes.contains(vibe["title"]);
              
//               return VibeCard(
//                 title: vibe["title"]!,
//                 subtitle: vibe["subtitle"]!,
//                 imageUrl: vibe["image"]!,
//                 isSelected: isSelected,
//                 onTap: () => provider.toggleVibe(vibe["title"]!),
//               );
//             },
//           ),
//         ),
//         Row(
//           children: [
//             Expanded(
//               child: TextButton(
//                 onPressed: () => provider.previousStep(),
//                 child: const Text("Back", style: TextStyle(color: Colors.white54)),
//               ),
//             ),
//             Expanded(
//               child: CustomButtonWidget(
//                 title: "Next",
//                 onTap: provider.selectedVibes.isNotEmpty ? () => provider.nextStep() : null,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 24.h),
//       ],
//     );
//   }
// }
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

    final List<Map<String, String>> vibes = [
      {"title": "Streetwear", "subtitle": "Layered, bold, off-duty", "image": "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=600&auto=format&fit=crop"},
      {"title": "Elevated Casual", "subtitle": "Tailored basics, quiet luxury", "image": "https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=600&auto=format&fit=crop"},
      {"title": "Business Chic", "subtitle": "Sharp, considered, modern", "image": "https://images.unsplash.com/photo-1483985988355-763728e1935b?q=80&w=600&auto=format&fit=crop"},
      {"title": "Eclectic", "subtitle": "Color, print, statement", "image": "https://images.unsplash.com/photo-1509631179647-0177331693ae?q=80&w=600&auto=format&fit=crop"},
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
          "Pick the ones that feel most like you (multiple selection).", 
          style: TextStyle(color: Colors.white38, fontSize: 13.sp),
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
}