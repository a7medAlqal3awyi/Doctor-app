import 'package:dooc_app/core/helpers/constatnts.dart';
import 'package:dooc_app/core/helpers/exetention.dart';
import 'package:dooc_app/core/helpers/shared_pref_helper.dart';
import 'package:dooc_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';
import 'core/service/local_services/cache_helper.dart';
import 'core/service/remote_services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkIfUserLogin();
  await CacheHelper.init();

  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}

checkIfUserLogin() async {
  String? userToken =
      await CacheHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
