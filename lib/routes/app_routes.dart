
import 'package:fitted/features/auth/login/view/change_password_view.dart';
import 'package:fitted/features/auth/login/view/custom_login_tab_screen.dart';
import 'package:fitted/features/auth/login/view/forgot_password_otp.dart';
import 'package:fitted/features/auth/login/view/forgot_password_view.dart';
import 'package:fitted/features/auth/login/view/verify_phone_number_otp.dart';
import 'package:fitted/features/auth/signup/view/sign_up_email_otp.dart';
import 'package:fitted/features/auth/signup/view/sign_up_phone_otp.dart';
import 'package:fitted/features/auth/signup/view/signup_tab_screen.dart';
import 'package:fitted/features/onboarding/view/onboardingScreen.dart';
import 'package:fitted/features/splash/view/splash_screen.dart';
import 'package:fitted/features/subscription/view/subscription_view.dart';
import 'package:flutter/material.dart';

class AppRoute {

 static final Map<String, WidgetBuilder>  appRoute = {
    SplashScreen.splashScreen: (context)=> const SplashScreen(),
    OnBoardingScreen.onBoardingScreen: (context)=> const OnBoardingScreen(),
    SubscriptionView.subscriptionView: (context)=>  SubscriptionView(),
    CustomLoginTabScreen.loginTabScreen: (context)=> const CustomLoginTabScreen(),
    ForgotPasswordView.forgotPasswordView: (context)=> const ForgotPasswordView(),
    ForgotPasswordOtp.forgotPasswordOtp: (context)=> const ForgotPasswordOtp(),
    ChangePasswordView.changePasswordView: (context)=> const ChangePasswordView(),
    VerifyPhoneNumberOtp.verifyPhoneNumberOtp: (context)=> const VerifyPhoneNumberOtp(),
    SignUpTabScreen.signUpTabScreen: (context)=> const SignUpTabScreen(),
      SignUpEmailOtp.signUpEmailOtp: (context)=> const SignUpEmailOtp(),
      SignUpPhoneOtp.signUpPhoneOtp: (context)=> const SignUpPhoneOtp(),







  };

   
  
}
