import 'package:dooc_app/core/routing/routes.dart';
import 'package:dooc_app/core/service/remote_services/service_locator.dart';
import 'package:dooc_app/feature/auth/login/logic/login_cubit.dart';
import 'package:dooc_app/feature/auth/sign_up/logic/register_cubit.dart';
import 'package:dooc_app/feature/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/auth/login/ui/login_screen.dart';

// import '../../feature/auth/register/ui/register_screen.dart';
import '../../feature/auth/sign_up/ui/register_screen.dart';
import '../../feature/home/ui/home_screen.dart';
import '../../feature/onboarding/onboarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => getIt<LoginCubit>(),
              child: const LoginScreen()),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => getIt<RegisterCubit>(),
              child: const RegisterScreen()),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>()..fetchSpecializations(),
            child: const HomeScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
