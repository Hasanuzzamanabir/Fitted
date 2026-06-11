import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class FontManager {
  // ================== Font Families ==================
  static const String dmSans = "dmSans";
  static const String playfairDisplay = "PlayfairDisplay";
  static const String urbanist = "Urbanist";
  static const String gabarito = "Gabarito";

  // ================== Font Weights ==================
  static const FontWeight w400 = FontWeight.w400;
  static const FontWeight w500 = FontWeight.w500;
  static const FontWeight w600 = FontWeight.w600;
  static const FontWeight w700 = FontWeight.w700;
  // ================== DM Sans ==================

static TextStyle dmSansH1() => TextStyle(
  color: AppColors.textprimary,
  fontFamily: dmSans,
  fontSize: 24.sp,
  fontWeight: w700,
  height: 1.1,
);

static TextStyle dmSansH2() => TextStyle(
  color: AppColors.textprimary,
  fontFamily: dmSans,
  fontSize: 20.sp,
  fontWeight: w500,
  height: 1.1,
);

static TextStyle dmSansH3() => TextStyle(
  color: AppColors.textprimary,
  fontFamily: dmSans,
  fontSize: 16.sp,
  fontWeight: w400,
  height: 1.1,
);

static TextStyle dmSansH4() => TextStyle(
  color: AppColors.textprimary,
  fontFamily: dmSans,
  fontSize: 32.sp,
  fontWeight: w600,
  height: 1.1,
);
static TextStyle dmSansH5() => TextStyle(
  color: AppColors.textprimary,
  fontFamily: dmSans,
  fontSize: 16.sp,
  fontWeight: w500,
  height: 1.1,
);



// ================== Playfair Display ==================

static TextStyle playfairH1() => TextStyle(
  color: AppColors.textprimary,
  fontFamily: playfairDisplay,
  fontSize: 32.sp,
  fontWeight: w700,
  height: 1.1,
);

static TextStyle playfairH2() => TextStyle(
  color: AppColors.textprimary,
  fontFamily: playfairDisplay,
  fontSize: 24.sp,
  fontWeight: w600,
  height: 1.1,
);

static TextStyle playfairH3() => TextStyle(
  color: AppColors.textprimary,
  fontFamily: playfairDisplay,
  fontSize: 16.sp,
  fontWeight: w400,
  height: 1.1,
);

static TextStyle playfairH4() => TextStyle(
  color: AppColors.textprimary,
  fontFamily: playfairDisplay,
  fontSize: 20.sp,
  fontWeight: w400,
  height: 1.1,
);
static TextStyle playfairH5() => TextStyle(
  color: AppColors.textprimary,
  fontFamily: playfairDisplay,
  fontSize: 20.sp,
  fontWeight: w500,
  height: 1.1,
);

}
