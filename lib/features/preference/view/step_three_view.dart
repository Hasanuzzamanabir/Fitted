
import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:fitted/features/preference/provider/preference_provider.dart';
import 'package:fitted/features/preference/view/preference_flow_view.dart';
import 'package:fitted/features/preference/widgets/custom_colorpicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class StepThreeView extends StatelessWidget {
  const StepThreeView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PreferenceProvider>(context);
    final colorsList = provider.colorVibes;

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
          "Pick the tones that you gravitate towards (multiple selection)",
          style: TextStyle(color: Colors.white38, fontSize: 13.sp),
        ),
        SizedBox(height: 24.h),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 1.2,
            ),
            itemCount: colorsList.length + 1,
            itemBuilder: (context, index) {
              if (index < colorsList.length) {
                final colorItem = colorsList[index];
                bool isSelected = provider.selectedColors.contains(colorItem["hex"]);
                Color cardColor = Color(int.parse("0xFF${colorItem["hex"]}"));
                
                Color textColor = ThemeData.estimateBrightnessForColor(cardColor) == Brightness.light 
                    ? Colors.black 
                    : Colors.white;

                return GestureDetector(
                  onTap: () => provider.toggleColor(colorItem["hex"]!),
                  child: Container(
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(16.r),
                      border: isSelected ? Border.all(color: Colors.white, width: 3.w) : null,
                    ),
                    padding: EdgeInsets.all(12.w),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            colorItem["name"]!,
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        if (isSelected)
                          Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.check_circle, 
                              color: textColor == Colors.black ? Colors.black87 : Colors.white, 
                              size: 20.sp,
                            ),
                          )
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
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B1720),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Colors.white10, width: 1),
                    ),
                    child: Icon(
                      Icons.add_circle_outline,
                      color: AppColors.primecolor,
                      size: 28.sp,
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