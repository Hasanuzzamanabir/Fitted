// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';
// import 'package:fitted/core/theme/app_colors.dart';
// import 'package:fitted/core/theme/font_manager.dart';
// import 'package:fitted/core/widgets/custom_button_widgets.dart';

// class CustomLoadingFlowView extends StatelessWidget {
//   final String titlePrefix;
//   final String titleHighlight;
//   final String subtitle;
//   final String animationPath;
//   final String? statusText;
//   final String buttonTitle;
//   final VoidCallback onButtonTap;

//   const CustomLoadingFlowView({
//     super.key,
//     required this.titlePrefix,
//     required this.titleHighlight,
//     required this.subtitle,
//     required this.animationPath,
//     required this.buttonTitle,
//     required this.onButtonTap,
//     this.statusText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bgprime,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
//           child: Column(
//             children: [
//               SizedBox(height: 40.h),
//               RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(
//                   text: titlePrefix,
//                   style: FontManager.playfairH5().copyWith(
//                     color: Colors.white,
//                     fontSize: 32.sp,
//                     fontWeight: FontWeight.w400,
//                   ),
//                   children: [
//                     TextSpan(
//                       text: titleHighlight,
//                       style: TextStyle(color: AppColors.primecolor),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 12.h),
//               Text(
//                 subtitle,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white60,
//                   fontSize: 14.sp,
//                   height: 1.4,
//                 ),
//               ),
//               const Spacer(),
//               Lottie.asset(
//                 animationPath,
//                 width: 250.w,
//                 height: 150.h,
//                 fit: BoxFit.contain,
//               ),
//               SizedBox(height: 24.h),
//               if (statusText != null)
//                 Text(
//                   statusText!,
//                   style: TextStyle(
//                     color: AppColors.primecolor,
//                     fontSize: 16.sp,
//                     fontStyle: FontStyle.italic,
//                   ),
//                 ),
//               const Spacer(),
//               CustomButtonWidget(
//                 title: buttonTitle,
//                 onTap: onButtonTap,
//               ),
//               SizedBox(height: 12.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';

class CustomLoadingFlowView extends StatefulWidget {
  final String titlePrefix;
  final String titleHighlight;
  final String subtitle;
  final String animationPath;
  final String? statusText;
  final VoidCallback onAnimationComplete;

  const CustomLoadingFlowView({
    super.key,
    required this.titlePrefix,
    required this.titleHighlight,
    required this.subtitle,
    required this.animationPath,
    required this.onAnimationComplete,
    this.statusText,
  });

  @override
  State<CustomLoadingFlowView> createState() => _CustomLoadingFlowViewState();
}

class _CustomLoadingFlowViewState extends State<CustomLoadingFlowView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        widget.onAnimationComplete();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgprime,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: widget.titlePrefix,
                  style: FontManager.playfairH5().copyWith(
                    color: Colors.white,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: widget.titleHighlight,
                      style: TextStyle(color: AppColors.primecolor),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                widget.subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 14.sp,
                  height: 1.4,
                ),
              ),
              const Spacer(),
              Lottie.asset(
                widget.animationPath,
                width: 250.w,
                height: 150.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 24.h),
              if (widget.statusText != null)
                Text(
                  widget.statusText!,
                  style: TextStyle(
                    color: AppColors.primecolor,
                    fontSize: 16.sp,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              const Spacer(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}