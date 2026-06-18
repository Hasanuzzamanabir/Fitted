import 'package:fitted/features/auth/login/view/change_password_view.dart';
import 'package:fitted/features/auth/login/view/custom_login_tab_screen.dart';
import 'package:fitted/features/auth/login/view/forgot_password_otp.dart';
import 'package:fitted/features/auth/login/view/forgot_password_view.dart';
import 'package:fitted/features/auth/login/view/verify_phone_number_otp.dart';
import 'package:fitted/features/auth/signup/view/sign_up_email_otp.dart';
import 'package:fitted/features/auth/signup/view/sign_up_phone_otp.dart';
import 'package:fitted/features/auth/signup/view/signup_tab_screen.dart';
import 'package:fitted/features/bottom_nav_bar/view/bottom_nav_bar_view.dart';
import 'package:fitted/features/event_section/view/calender_view.dart';
import 'package:fitted/features/home/view/home_view.dart';
import 'package:fitted/features/onboarding/view/onboardingScreen.dart';
import 'package:fitted/features/plan_outfit_view/view/outfit_recomendation_view.dart';
import 'package:fitted/features/plan_outfit_view/view/plan_outfit_view.dart';
import 'package:fitted/features/plan_outfit_view/view/style_loading_screen.dart';
import 'package:fitted/features/preference/view/preference_flow_view.dart';
import 'package:fitted/features/preference/view/profile_loading_view.dart';
import 'package:fitted/features/profile_section/edit_preference/view/edit_preference_view.dart';
import 'package:fitted/features/profile_section/notification/view/notification.dart';
import 'package:fitted/features/profile_section/profile/view/edit_profile.dart';
import 'package:fitted/features/profile_section/profile/view/profile_view.dart';
import 'package:fitted/features/profile_section/setting/view/setting_view.dart';
import 'package:fitted/features/profile_section/manage_subscription/view/Manage_subscription_view.dart';
import 'package:fitted/features/profile_section/support_and_priveacy/view/help_and_support.dart';
import 'package:fitted/features/profile_section/support_and_priveacy/view/security.dart';
import 'package:fitted/features/splash/view/splash_screen.dart';
import 'package:fitted/features/subscription/view/subscription_view.dart';
import 'package:fitted/features/wardrobe/view/wardrob_view.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static final Map<String, WidgetBuilder> appRoute = {
    SplashScreen.splashScreen: (context) => const SplashScreen(),
    OnBoardingScreen.onBoardingScreen: (context) => const OnBoardingScreen(),
    SubscriptionView.subscriptionView: (context) => SubscriptionView(),
    CustomLoginTabScreen.loginTabScreen: (context) =>
        const CustomLoginTabScreen(),
    ForgotPasswordView.forgotPasswordView: (context) =>
        const ForgotPasswordView(),
    ForgotPasswordOtp.forgotPasswordOtp: (context) => const ForgotPasswordOtp(),
    ChangePasswordView.changePasswordView: (context) =>
        const ChangePasswordView(),
    VerifyPhoneNumberOtp.verifyPhoneNumberOtp: (context) =>
        const VerifyPhoneNumberOtp(),
    SignUpTabScreen.signUpTabScreen: (context) => const SignUpTabScreen(),
    SignUpEmailOtp.signUpEmailOtp: (context) => const SignUpEmailOtp(),
    SignUpPhoneOtp.signUpPhoneOtp: (context) => const SignUpPhoneOtp(),
    HomeView.homeView: (context) => const HomeView(),
    PlanOutfitView.planOutfitView: (context) => const PlanOutfitView(),
    ProfileView.profileView: (context) => const ProfileView(),
    EditProfileView.editProfileView: (context) => const EditProfileView(),
    SettingView.settingView: (context) => const SettingView(),
    NotificationsSettingsView.notificationsSettingsView: (context) =>
        const NotificationsSettingsView(),
    SecuritySettingsView.securitySettingsView: (context) =>
        const SecuritySettingsView(),
    HelpSupportView.helpSupportView: (context) => const HelpSupportView(),
    ManageSubscriptionView.manageSubscriptionView: (context) =>
        const ManageSubscriptionView(),
    PreferenceFlowView.preferenceFlowView: (context) =>
        const PreferenceFlowView(),
    EditStylePreferencesView.editstylepreference: (context) =>
        const EditStylePreferencesView(),
    BottomNavBarView.bottomNavBarView: (context) => const BottomNavBarView(),
    WardrobeView.wardrobeView: (context) => const WardrobeView(),
    CalendarView.calendarView: (context) => const CalendarView(),
    ProfileLoadingView.profileLoadingView: (context) => const ProfileLoadingView(),
    StylingLoadingScreen.stylingLoadingScreen: (context) => const StylingLoadingScreen(),
    OutfitRecommendationView.outfitRecommendationView: (context) => const OutfitRecommendationView(),
  };

 
}
