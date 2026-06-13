import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../provider/preference_provider.dart';
import '../widgets/step_progress_bar.dart';
import 'step_one_view.dart';
import 'step_two_view.dart';
import 'step_three_view.dart';
import 'step_four_view.dart';

class PreferenceFlowView extends StatelessWidget {
  const PreferenceFlowView({super.key});
  static const String preferenceFlowView = '/preferenceFlowView';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PreferenceProvider>(context);

    final List<Widget> steps = [
      const StepOneView(),
      const StepTwoView(),
      const StepThreeView(),
      const StepFourView(),
    ];

    return Scaffold(
      backgroundColor: AppColors.bgprime,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "STEP ${provider.currentStep + 1} OF 4",
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              StepProgressBar(currentStep: provider.currentStep),
              Expanded(
                child: steps[provider.currentStep],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addCustomColor(String hexString) {}
}