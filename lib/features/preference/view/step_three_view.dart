
// import 'package:fitted/core/theme/app_colors.dart';
// import 'package:fitted/core/theme/font_manager.dart';
// import 'package:fitted/core/widgets/custom_button_widgets.dart';
// import 'package:fitted/features/preference/provider/preference_provider.dart';
// import 'package:fitted/features/preference/view/preference_flow_view.dart';
// import 'package:fitted/features/preference/widgets/custom_colorpicker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';


// class StepThreeView extends StatelessWidget {
//   const StepThreeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<PreferenceProvider>(context);
//     final colorsList = provider.colorVibes;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: 32.h),
//         RichText(
//           text: TextSpan(
//             text: "What's your ",
//             style: FontManager.playfairH5().copyWith(color: Colors.white, fontSize: 32.sp),
//             children: [
//               TextSpan(text: "colour", style: TextStyle(color: AppColors.primecolor)),
//               const TextSpan(text: " vibe?"),
//             ],
//           ),
//         ),
//         SizedBox(height: 8.h),
//         Text(
//           "Pick the tones that you gravitate towards (multiple selection)",
//           style: TextStyle(color: Colors.white38, fontSize: 13.sp),
//         ),
//         SizedBox(height: 24.h),
//         Expanded(
//           child: GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 16.w,
//               mainAxisSpacing: 16.h,
//               childAspectRatio: 1.2,
//             ),
//             itemCount: colorsList.length + 1,
//             itemBuilder: (context, index) {
//               if (index < colorsList.length) {
//                 final colorItem = colorsList[index];
//                 bool isSelected = provider.selectedColors.contains(colorItem["hex"]);
//                 Color cardColor = Color(int.parse("0xFF${colorItem["hex"]}"));
                
//                 Color textColor = ThemeData.estimateBrightnessForColor(cardColor) == Brightness.light 
//                     ? Colors.black 
//                     : Colors.white;

//                 return GestureDetector(
//                   onTap: () => provider.toggleColor(colorItem["hex"]!),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: cardColor,
//                       borderRadius: BorderRadius.circular(16.r),
//                       border: isSelected ? Border.all(color: Colors.white, width: 3.w) : null,
//                     ),
//                     padding: EdgeInsets.all(12.w),
//                     child: Stack(
//                       children: [
//                         Align(
//                           alignment: Alignment.bottomLeft,
//                           child: Text(
//                             colorItem["name"]!,
//                             style: TextStyle(
//                               color: textColor,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 14.sp,
//                             ),
//                           ),
//                         ),
//                         if (isSelected)
//                           Align(
//                             alignment: Alignment.topRight,
//                             child: Icon(
//                               Icons.check_circle, 
//                               color: textColor == Colors.black ? Colors.black87 : Colors.white, 
//                               size: 20.sp,
//                             ),
//                           )
//                       ],
//                     ),
//                   ),
//                 );
//               } else {
//                 return GestureDetector(
//                   onTap: () {
//                     showDialog(
//                       context: context,
//                       builder: (context) => CustomColorPickerDialog(
//                         onColorConfirmed: (hexString) {
//                           provider.addCustomColor(hexString);
//                         },
//                       ),
//                     );
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF1B1720),
//                       borderRadius: BorderRadius.circular(16.r),
//                       border: Border.all(color: Colors.white10, width: 1),
//                     ),
//                     child: Icon(
//                       Icons.add_circle_outline,
//                       color: AppColors.primecolor,
//                       size: 28.sp,
//                     ),
//                   ),
//                 );
//               }
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
//                 onTap: provider.selectedColors.isNotEmpty ? () => provider.nextStep() : null,
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
import 'package:fitted/features/preference/provider/preference_provider.dart';
import 'package:fitted/features/preference/widgets/custom_colorpicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class StepThreeView extends StatelessWidget {
  const StepThreeView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PreferenceProvider>(context);
    final colorPalettes = provider.colorVibes;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32.h),
        RichText(
          text: TextSpan(
            text: "What's your ",
            style: FontManager.playfairH5().copyWith(color: Colors.white, fontSize: 32.sp),
            children: [
              TextSpan(text: "colour", style: TextStyle(color: AppColors.primecolor)),
              const TextSpan(text: " vibe?"),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "Pick the tones that you gravitate towards\n(multiple selection )",
          style: TextStyle(color: Colors.white38, fontSize: 13.sp, height: 1.3),
        ),
        SizedBox(height: 24.h),
        Expanded(
          child: ListView.builder(
            itemCount: colorPalettes.length + 1,
            padding: EdgeInsets.only(bottom: 16.h),
            itemBuilder: (context, index) {
              if (index < colorPalettes.length) {
                final palette = colorPalettes[index];
                final mainHex = palette["hexList"][0];
                bool isSelected = provider.selectedColors.contains(mainHex);

                return GestureDetector(
                  onTap: () => provider.toggleColor(mainHex),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0D0B0E),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: isSelected ? AppColors.primecolor.withOpacity(0.5) : Colors.white.withOpacity(0.05),
                        width: 1.w,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 64.w,
                          height: 64.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Row(
                            children: List.generate(
                              palette["hexList"].length,
                              (i) => Expanded(
                                child: Container(
                                  color: Color(int.parse("0xFF${palette["hexList"][i]}")),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                palette["name"],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                palette["subtitle"],
                                style: TextStyle(
                                  color: Colors.white38,
                                  fontSize: 11.sp,
                                  fontFamily: 'monospace',
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 20.r,
                          height: 20.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? AppColors.primecolor : Colors.white38,
                              width: 2.w,
                            ),
                            color: isSelected ? AppColors.primecolor : Colors.transparent,
                          ),
                          child: isSelected
                              ? Icon(Icons.check, color: Colors.white, size: 12.sp)
                              : null,
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomColorPickerDialog(
                        onColorConfirmed: (hexString) {
                          provider.addCustomColor(hexString);
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0D0B0E),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Colors.white.withOpacity(0.05), width: 1),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 64.w,
                          height: 64.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1B151A),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(
                            Icons.add,
                            color: AppColors.primecolor,
                            size: 24.sp,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Build your own",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                "Pick up to 4 custom shaded",
                                style: TextStyle(
                                  color: Colors.white38,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 20.r,
                          height: 20.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white38, width: 2.w),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
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
                onTap: provider.selectedColors.isNotEmpty ? () => provider.nextStep() : null,
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}