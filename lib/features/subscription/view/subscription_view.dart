import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/features/subscription/widgets/cta_button.dart';
import 'package:fitted/features/subscription/widgets/featureTile.dart';
import 'package:fitted/features/subscription/widgets/plan_card.dart';
import 'package:fitted/features/subscription/widgets/premium_header.dart';
import 'package:flutter/material.dart';

class SubscriptionView extends StatefulWidget {
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
  State<SubscriptionView> createState() => _SubscriptionViewState();
}

class _SubscriptionViewState extends State<SubscriptionView> {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.bgprime,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const PremiumHeader(),
              const SizedBox(height: 20),
              ...widget.features.map(
                (feature) => FeatureTile(title: feature),
              ),
              const PlanCard(
                title: "Monthly",
                subtitle: "per month",
                price: "\$9.99",
              ),
              const PlanCard(
                title: "Yearly",
                subtitle: "\$4.92/mo • save 50%",
                price: "\$59",
                isSelected: true,
                showBadge: true,
              ),
              TrialButton(onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  "/logintabscreen",
                );
              }),
                const SizedBox(height: 12),

              const Text(
                "Cancel anytime • Secure payment",
                style: TextStyle(
                  color: Colors.white54,
                ),),
            ],
          ),
        ),
      ),
    );
  }
}