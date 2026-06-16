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
import 'package:fitted/features/bottom_nav_bar/provider/bottom_nav_bar_provider.dart';
import 'package:fitted/features/preference/provider/preference_provider.dart';
import 'package:fitted/features/preference/view/preference_flow_view.dart';
import 'package:fitted/features/profile_section/profile/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitted/features/splash/view/splash_screen.dart';
import 'package:fitted/routes/app_routes.dart';
import 'package:provider/provider.dart';

class RouteLoggerObserver extends NavigatorObserver {
  String _routeName(Route<dynamic>? route) {
    if (route == null) {
      return 'unknown';
    }

    return route.settings.name ?? route.runtimeType.toString();
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('Route push: ${_routeName(route)}');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('Route pop: ${_routeName(route)}');
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    debugPrint('Route replace: ${_routeName(oldRoute)} -> ${_routeName(newRoute)}');
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}

class Fitted extends StatefulWidget {
  const Fitted({super.key});

  @override
  State<Fitted> createState() => _FittedState();
}

class _FittedState extends State<Fitted> {
  @override
  void initState() {
    super.initState();
    _logRegisteredRoutes();
  }

  void _logRegisteredRoutes() {
    debugPrint('Registered routes:');
    for (final routeName in AppRoute.appRoute.keys) {
      debugPrint(' - $routeName');
    }
  }

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
            ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
          ],
          child: MaterialApp(
            title: 'Fitted',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            navigatorObservers: [RouteLoggerObserver()],
            routes: AppRoute.appRoute,
            initialRoute: SplashScreen.splashScreen,
          ),
        );
      },
    );
  }
}