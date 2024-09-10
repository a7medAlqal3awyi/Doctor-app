import 'package:dooc_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'core/routing/app_router.dart';
import 'core/service/local_services/cache_helper.dart';
import 'core/service/remote_services/service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  setup();

  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
