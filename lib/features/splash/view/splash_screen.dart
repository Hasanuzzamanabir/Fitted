
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/features/onboarding/view/onboardingScreen.dart';
import 'package:fitted/routes/app_routes.dart';
import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String splashScreen = '/splashScreen';
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
  if (mounted) {
    Navigator.pushReplacementNamed(
      context,
      OnBoardingScreen.onBoardingScreen,
    );
  }
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ✅ Full screen background image
          SizedBox.expand(
            child: Image.asset(
              ImagePath.splashBackgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          //Hello

          // Centered loader
          Center(
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Color(0xffEC2028), Color(0xffFF9900)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
            
            ),
          ),
        ],
      ),
    );
  }
}
