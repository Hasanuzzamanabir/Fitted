// import 'package:fitted/features/splash/view/splash_screen.dart';
// import 'package:fitted/routes/app_routes.dart';
// import 'package:flutter/material.dart';

// class Fitted extends StatelessWidget {
//   const Fitted({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fitted',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       debugShowCheckedModeBanner: false,
//       routes: AppRoute.appRoute,
//       initialRoute: SplashScreen.splashScreen,
//     );
//   }
// }

import 'package:fitted/features/auth/login/provider/login_tab_provider.dart';
import 'package:fitted/features/auth/signup/provider/sign_up_tab_provider.dart';
import 'package:fitted/features/preference/provider/preference_provider.dart';
import 'package:fitted/features/preference/view/preference_flow_view.dart';
import 'package:fitted/features/profile_section/profile/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitted/features/splash/view/splash_screen.dart';
import 'package:fitted/routes/app_routes.dart';
import 'package:provider/provider.dart';

class Fitted extends StatelessWidget {
  const Fitted({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), 
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => LoginTabProvider()),
            ChangeNotifierProvider(create: (_) => SignUpTabProvider()),
            ChangeNotifierProvider(create: (_) => PreferenceProvider()),
          ],
        child: MaterialApp(
          title: 'Fitted',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: AppRoute.appRoute,
          initialRoute: ProfileView.profileView,
        ));
      },
    );
  }
}