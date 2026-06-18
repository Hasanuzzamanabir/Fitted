import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/features/auth/login/view/custom_login_tab_screen.dart';
import 'package:fitted/features/auth/signup/view/signup_tab_screen.dart';
import 'package:fitted/features/subscription/view/subscription_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:fitted/features/onboarding/widgets/custom_image_background.dart';
import 'package:flutter/material.dart';




import 'package:fitted/routes/app_routes.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
    static const String onBoardingScreen = '/onBoardingScreen';


  @override
  Widget build(BuildContext context) {
    return BackgroundImageScaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Column(
              children: [
                SizedBox(
                  height: 310.h,
                ),

                // SvgPicture.asset(
                //   ImagePath.onBoardingImage,
                //   fit: BoxFit.cover,
                //   height: 330.h,
                // ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Spacer(),


                SizedBox(
                  height: 320.h,
                ),

CustomButtonWidget(
  title: "Get Started",
  onTap: () {
    Navigator.pushReplacementNamed(
      context,
      SignUpTabScreen.signUpTabScreen,
    );
  },
),
                
                   SizedBox(height: 20.h),
                          RichText(
                            text: TextSpan(
                              text: "Already have an account?",
                                  // style: AppTextStyle.h5.copyWith(
                                  //   color: AppColors.textprimary,
                                  // ),
                              style: TextStyle(
                                color: AppColors.textprimary,),
                              children: [
                                TextSpan(
                                  text: 'Log In',
                                  style: TextStyle(
                                    color: AppColors.primecolor,
                                    fontWeight: FontWeight.w600,
                                  ),  
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                     Navigator.pushReplacementNamed(
                              context,
                              CustomLoginTabScreen.loginTabScreen,
                            );
                                    },
                                ),
                              ],
                            ),
                          ),

                SizedBox(
                  height: 130.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

