// import 'package:fitted/core/theme/app_colors.dart';
// import 'package:fitted/features/profile_section/edit_preference/view/edit_preference_view.dart';
// import 'package:fitted/features/profile_section/profile/view/edit_profile.dart';
// import 'package:fitted/features/profile_section/profile/view/profile_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import '../provider/bottom_nav_bar_provider.dart';

// class BottomNavBarView extends StatelessWidget {
//   const BottomNavBarView({super.key});
//   static const String bottomNavBarView = '/bottomNavBarView';

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<BottomNavBarProvider>(context);

//     final List<Widget> screens = [
//       const Center(child: Text("Home View", style: TextStyle(color: Colors.white))),
//       const Center(child: Text("Explore View", style: TextStyle(color: Colors.white))),
//       const Center(child: Text("Saved View", style: TextStyle(color: Colors.white))),
//       const ProfileView(),
//     ];

//     return WillPopScope(
//       onWillPop: () => provider.handleWillPop(),
//       child: Scaffold(
//         backgroundColor: AppColors.bgprime,
//         extendBody: true,
//         body: Stack(
//           children: List.generate(screens.length, (index) {
//             return Offstage(
//               offstage: provider.currentIndex != index,
//               child: Navigator(
//                 key: provider.navigatorKeys[index],
//                 onGenerateInitialRoutes: (navigator, initialRoute) {
//                   return [
//                     MaterialPageRoute(
//                       builder: (context) => Padding(
//                         padding: EdgeInsets.only(bottom: 92.h),
//                         child: screens[index],
//                       ),
//                     ),
//                   ];
//                 },
             
//               ),
//             );
//           }),
//         ),
//         bottomNavigationBar: Container(
//           margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
//           height: 72.h,
//           decoration: BoxDecoration(
//             color: const Color(0xFF131116),
//             borderRadius: BorderRadius.circular(36.r),
//             boxShadow: [
//               BoxShadow(
//                 color: const Color(0xFFF83E5A).withOpacity(0.40),
//                 blurRadius: 20.r,
//                 spreadRadius: 0.r,
//                 offset: const Offset(0, 0),
//               ),
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               _buildNavItem(provider, 0, Icons.home_outlined, "Home"),
//               _buildNavItem(provider, 1, Icons.explore_outlined, "Explore"),
//               _buildNavItem(provider, 2, Icons.bookmark_border_rounded, "Saved"),
//               _buildNavItem(provider, 3, Icons.account_circle_outlined, "Profile"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildNavItem(BottomNavBarProvider provider, int index, IconData icon, String label) {
//     bool isSelected = provider.currentIndex == index;
//     Color itemColor = isSelected ? AppColors.primecolor : Colors.white70;

//     return GestureDetector(
//       onTap: () => provider.changeIndex(index),
//       behavior: HitTestBehavior.opaque,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, color: itemColor, size: 24.sp),
//           SizedBox(height: 4.h),
//           Text(
//             label,
//             style: TextStyle(
//               color: itemColor,
//               fontSize: 12.sp,
//               fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/features/explore/view/explore_view.dart';
import 'package:fitted/features/home/view/home_view.dart';
import 'package:fitted/features/profile_section/profile/view/profile_view.dart';
import 'package:fitted/features/save_section/view/saved_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../provider/bottom_nav_bar_provider.dart';

class BottomNavBarView extends StatelessWidget {
  const BottomNavBarView({super.key});
  static const String bottomNavBarView = '/bottomNavBarView';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavBarProvider>(context);

    final List<Widget> screens = [
      const HomeView(),
      const ExploreView(),
      const SavedView(),
      const ProfileView(),
    ];

    return WillPopScope(
      onWillPop: () => provider.handleWillPop(),
      child: Scaffold(
        backgroundColor: AppColors.bgprime,
        extendBody: true,
        body: IndexedStack(
          index: provider.currentIndex,
          children: screens,
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
          height: 72.h,
          decoration: BoxDecoration(
            color: const Color(0xFF131116),
            borderRadius: BorderRadius.circular(36.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFF83E5A).withOpacity(0.40),
                blurRadius: 20.r,
                spreadRadius: 0.r,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(provider, 0, Icons.home_outlined, "Home"),
              _buildNavItem(provider, 1, Icons.explore_outlined, "Explore"),
              _buildNavItem(provider, 2, Icons.bookmark_border_rounded, "Saved"),
              _buildNavItem(provider, 3, Icons.account_circle_outlined, "Profile"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(BottomNavBarProvider provider, int index, IconData icon, String label) {
    bool isSelected = provider.currentIndex == index;
    Color itemColor = isSelected ? AppColors.primecolor : Colors.white70;

    return GestureDetector(
      onTap: () => provider.changeIndex(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: itemColor, size: 24.sp),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              color: itemColor,
              fontSize: 12.sp,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}