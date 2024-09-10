import 'package:dooc_app/core/routing/routes.dart';
import 'package:flutter/material.dart';

import '../../feature/auth/login/ui/login_screen.dart';
// import '../../feature/auth/register/ui/register_screen.dart';
import '../../feature/onboarding/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      // case Routes.homeScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const HomeScreen(),
      //   ); case Routes.registerScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const RegisterScreen(),
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
