import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/features/subscription/widgets/cta_button.dart';
import 'package:fitted/features/subscription/widgets/featureTile.dart';
import 'package:fitted/features/subscription/widgets/plan_card.dart';
import 'package:fitted/features/subscription/widgets/premium_header.dart';
import 'package:fitted/features/subscription/provider/subscription_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SubscriptionView extends StatelessWidget {
  SubscriptionView({super.key});
  
  final features = [
    "Personalized outfit recommendations",
    "AI-powered style & color analysis",
    "Save favorite looks and style history",
    "Access to premium fashion collections",
    "Seasonal trend forecasts and updates",
    "Daily outfit inspiration tailored to you",
  ];
  
  static const String subscriptionView = '/subscriptionView';

  @override
  Widget build(BuildContext context) {
    final subscriptionProvider = context.watch<SubscriptionProvider>();

    return Scaffold(
      backgroundColor: AppColors.bgprime,
      body: SafeArea(
        top: true,
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 16.h, bottom: 40.h),
          child: Column(
            children: [
              const PremiumHeader(),
              SizedBox(height: 24.h),
              ...features.map(
                (feature) => Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: FeatureTile(title: feature),
                ),
              ),
              SizedBox(height: 16.h),
              PlanCard(
                title: "Monthly",
                subtitle: "per month",
                price: "\$9.99",
                isSelected: subscriptionProvider.selectedPlanIndex == 0,
                onTap: () {
                  context.read<SubscriptionProvider>().updatePlanIndex(0);
                },
              ),
              SizedBox(height: 12.h),
              PlanCard(
                title: "Yearly",
                subtitle: "\$4.92/mo • save 50%",
                price: "\$59",
                isSelected: subscriptionProvider.selectedPlanIndex == 1,
                showBadge: true,
                onTap: () {
                  context.read<SubscriptionProvider>().updatePlanIndex(1);
                },
              ),
              SizedBox(height: 24.h),
              TrialButton(onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  "/logintabscreen",
                  arguments: subscriptionProvider.selectedPlanTitle, 
                );
              }),
              SizedBox(height: 16.h),
              Text(
                "Cancel anytime • Secure payment",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}