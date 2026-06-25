// import 'package:fitted/core/theme/app_colors.dart';
// import 'package:fitted/core/theme/font_manager.dart';
// import 'package:fitted/core/widgets/custom_button_widgets.dart';
// import 'package:fitted/features/preference/view/profile_loading_view.dart'; // 👈 আপনার সঠিক পাথ অনুযায়ী ইমপোর্ট চেক করে নিন
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import '../provider/preference_provider.dart';

// class StepFourView extends StatelessWidget {
//   const StepFourView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<PreferenceProvider>(context);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: 32.h),
//         RichText(
//           text: TextSpan(
//             text: "Final ",
//             style: FontManager.playfairH5().copyWith(color: Colors.white, fontSize: 32.sp),
//             children: [
//               TextSpan(text: "details.", style: TextStyle(color: AppColors.primecolor)),
//             ],
//           ),
//         ),
//         SizedBox(height: 8.h),
//         Text("Set your budget and fit preferences.", style: TextStyle(color: Colors.white38, fontSize: 13.sp)),
//         SizedBox(height: 32.h),
//         Text("Preferred Fit", style: TextStyle(color: Colors.white70, fontSize: 14.sp)),
//         SizedBox(height: 12.h),
//         Row(
//           children: ["Tailored", "Regular", "Oversized"].map((fit) {
//             bool isSelected = provider.preferredFit == fit;
//             return Expanded(
//               child: GestureDetector(
//                 onTap: () => provider.setPreferredFit(fit),
//                 child: Container(
//                   margin: EdgeInsets.symmetric(horizontal: 4.w),
//                   padding: EdgeInsets.symmetric(vertical: 12.h),
//                   decoration: BoxDecoration(
//                     color: isSelected ? AppColors.primecolor : const Color(0xFF1B1720),
//                     borderRadius: BorderRadius.circular(12.r),
//                   ),
//                   alignment: Alignment.center,
//                   child: Text(fit, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//         SizedBox(height: 40.h),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text("Price Range", style: TextStyle(color: Colors.white70, fontSize: 14.sp)),
//             Text("\$\$\$", style: TextStyle(color: AppColors.primecolor, fontSize: 14.sp, fontWeight: FontWeight.bold)),
//           ],
//         ),
//         Slider(
//           value: provider.priceRange,
//           activeColor: AppColors.primecolor,
//           inactiveColor: Colors.white12,
//           onChanged: (val) => provider.setPriceRange(val),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text("Budget", style: TextStyle(color: Colors.white38, fontSize: 11.sp)),
//             Text("Luxury", style: TextStyle(color: Colors.white38, fontSize: 11.sp)),
//           ],
//         ),
//         const Spacer(),
//         CustomButtonWidget(
//           title: "Complete profile",
//           onTap: (provider.preferredFit != null) ? () {
//             Navigator.pushNamed(
//               context, 
//               ProfileLoadingView.profileLoadingView, 
//             );
//           } : null,
//         ),
//         Center(
//           child: TextButton(
//             onPressed: () => provider.previousStep(),
//             child: const Text("Back", style: TextStyle(color: Colors.white54)),
//           ),
//         ),
//         SizedBox(height: 16.h),
//       ],
//     );
//   }
// }
import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:fitted/features/preference/view/profile_loading_view.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../provider/preference_provider.dart';

class StepFourView extends StatelessWidget {
  const StepFourView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PreferenceProvider>(context);

    String getPriceSign(double value) {
      if (value == 0.0) return "\$";
      if (value == 0.5) return "\$\$";
      return "\$\$\$";
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32.h),
        RichText(
          text: TextSpan(
            text: "Final ",
            style: FontManager.playfairH5().copyWith(color: Colors.white, fontSize: 32.sp),
            children: [
              TextSpan(text: "details.", style: TextStyle(color: AppColors.primecolor)),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Text("Set your budget and fit preferences.", style: TextStyle(color: Colors.white38, fontSize: 13.sp)),
        SizedBox(height: 32.h),
        Text("Preferred Fit", style: TextStyle(color: Colors.white70, fontSize: 14.sp)),
        SizedBox(height: 12.h),
        Row(
          children: ["Tailored", "Regular", "Oversized"].map((fit) {
            bool isSelected = provider.preferredFit == fit;
            return Expanded(
              child: GestureDetector(
                onTap: () => provider.setPreferredFit(fit),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primecolor : const Color(0xFF1B1720),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: isSelected ? Colors.white30 : Colors.transparent,
                      width: 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(fit, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 40.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Price Level", style: TextStyle(color: Colors.white70, fontSize: 14.sp)),
            Text(
              getPriceSign(provider.priceRange), 
              style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            {"label": "Affordable", "value": 0.0},
            {"label": "Mid-Range", "value": 0.5},
            {"label": "Luxury", "value": 1.0},
          ].map((priceItem) {
            final double itemValue = priceItem["value"] as double;
            final String label = priceItem["label"] as String;
            bool isSelected = provider.priceRange == itemValue;

            return Expanded(
              child: GestureDetector(
                onTap: () => provider.setPriceRange(itemValue),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primecolor : const Color(0xFF1B1720),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: isSelected ? Colors.white30 : Colors.transparent,
                      width: 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                ),
              ),
            );
          }).toList(),
        ),
        const Spacer(),
        CustomButtonWidget(
          title: "Complete profile",
          onTap: (provider.preferredFit != null) ? () {
            Navigator.pushNamed(
              context, 
              ProfileLoadingView.profileLoadingView, 
            );
          } : null,
        ),
        Center(
          child: TextButton(
            onPressed: () => provider.previousStep(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.arrow_back, color: Colors.white54, size: 16),
                SizedBox(width: 4.w),
                const Text("Back", style: TextStyle(color: Colors.white54)),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}