// import 'package:fitted/core/theme/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class VibeCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String imageUrl;
//   final bool isSelected;
//   final VoidCallback onTap;

//   const VibeCard({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.imageUrl,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16.r),
//           border: Border.all(
//             color: isSelected ? AppColors.primecolor : Colors.transparent,
//             width: 2.w,
//           ),
//           image: DecorationImage(
//             image: NetworkImage(imageUrl),
//             fit: BoxFit.cover,
//             colorFilter: ColorFilter.mode(
//               Colors.black.withOpacity(0.4),
//               BlendMode.darken,
//             ),
//           ),
//         ),
//         padding: EdgeInsets.all(12.w),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Align(
//               alignment: Alignment.topRight,
//               child: Container(
//                 padding: EdgeInsets.all(4.w),
//                 decoration: BoxDecoration(
//                   color: isSelected ? AppColors.primecolor : Colors.black45,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   isSelected ? Icons.check : Icons.add,
//                   color: Colors.white,
//                   size: 14.sp,
//                 ),
//               ),
//             ),
//             const Spacer(),
//             Text(
//               title,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16.sp,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(height: 4.h),
//             Text(
//               subtitle,
//               style: TextStyle(
//                 color: Colors.white70,
//                 fontSize: 11.sp,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:fitted/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VibeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final bool isSelected;
  final VoidCallback onTap;

  const VibeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          decoration: 
          BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
              colorFilter: isSelected
                  ? ColorFilter.mode(
                     AppColors.primecolor.withOpacity(0.4),
                     
                   
                      BlendMode.colorBurn,
                    )
                  : ColorFilter.mode(
                      Colors.black.withOpacity(0.4),
                      BlendMode.darken,
                    ),
            ),
          ),
          child: Stack(
            children: [
              if (isSelected)
                Positioned(
                  top: 12.h,
                  right: 12.w,
                  child: Container(
                    padding: EdgeInsets.all(1.w),
                    // decoration: const BoxDecoration(
                    //   color: Colors.white,
                    //   shape: BoxShape.circle,
                    // ),
                    child: Icon(
                      Icons.check_circle,
                      color: AppColors.primecolor,
                      size: 20.sp,
                    ),
                  ),
                ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        // Colors.transparent,
                        Color(0x0DFFFFFF),
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Serif',
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}