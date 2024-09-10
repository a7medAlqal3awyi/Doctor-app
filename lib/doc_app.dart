import 'package:dooc_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/routes.dart';
import 'core/service/remote_services/service_locator.dart';
import 'feature/auth/login/data/repo/login_repo_impl.dart';
import 'feature/auth/login/logic/login_cubit.dart';

class DocApp extends StatelessWidget {
  const DocApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
          create: (context)=> LoginCubit(getIt.get<LoginRepoImpl>())),

        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.onBoarding,
          onGenerateRoute: appRouter.generateRoute,
        ),
      ),
    );
  }
}
