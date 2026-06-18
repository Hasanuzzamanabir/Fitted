import 'package:fitted/core/widgets/custom_loading_flow_view.dart';
import 'package:fitted/features/plan_outfit_view/view/outfit_recomendation_view.dart';
import 'package:flutter/material.dart';

class StylingLoadingScreen extends StatelessWidget {
  const StylingLoadingScreen({super.key});
  static const String stylingLoadingScreen = '/stylingLoadingScreen';

  @override
  Widget build(BuildContext context) {
    return CustomLoadingFlowView(
      titlePrefix: "Styling your ",
      titleHighlight: "look..",
      subtitle: "Cross-referencing your wardrobe, the weather\nand your style profile",
      animationPath: 'assets/animations/load.json', 
      buttonTitle: "Continue",
      onButtonTap: () {
        Navigator.pushReplacementNamed(
          context, 
          OutfitRecommendationView.outfitRecommendationView,
        );
        
      },
    );
  }
}