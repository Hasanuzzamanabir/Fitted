// import 'package:fitted/core/widgets/custom_loading_flow_view.dart';
// import 'package:fitted/features/bottom_nav_bar/view/bottom_nav_bar_view.dart';
// import 'package:flutter/material.dart';
  
// class ProfileLoadingView extends StatelessWidget {
//   const ProfileLoadingView({super.key});
//   static const String profileLoadingView = '/profileLoadingView';

//   @override
//   Widget build(BuildContext context) {
//     return CustomLoadingFlowView(
//       titlePrefix: "Setting your ",
//       titleHighlight: "profile.",
//       subtitle: "It might take up to a minute to load the profile",
//       animationPath: 'assets/animations/load.json', 
//       statusText: "Loading...",
//       buttonTitle: "Go to home",
//       onButtonTap: () {
//         Navigator.pushNamedAndRemoveUntil(
//           context, 
//           BottomNavBarView.bottomNavBarView, 
//           (route) => false,
//         );
//       },
//     );
//   }
// }
import 'package:fitted/core/widgets/custom_loading_flow_view.dart';
import 'package:fitted/features/bottom_nav_bar/view/bottom_nav_bar_view.dart';
import 'package:flutter/material.dart';
  
class ProfileLoadingView extends StatelessWidget {
  const ProfileLoadingView({super.key});
  static const String profileLoadingView = '/profileLoadingView';

  @override
  Widget build(BuildContext context) {
    return CustomLoadingFlowView(
      titlePrefix: "Setting your ",
      titleHighlight: "profile.",
      subtitle: "It might take up to a minute to load the profile",
      animationPath: 'assets/animations/load.json', 
      statusText: "Loading...",
      onAnimationComplete: () {
        Navigator.pushNamedAndRemoveUntil(
          context, 
          BottomNavBarView.bottomNavBarView, 
          (route) => false,
        );
      },
    );
  }
}