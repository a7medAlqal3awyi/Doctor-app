import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../local_services/cache_helper.dart';
import '../local_services/cache_keys.dart';

class AuthenticatorInterceptor extends Interceptor {
  AuthenticatorInterceptor();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = CacheHelper.getData(key:CacheKeysManger.tokenStatus());
    if (token != null) {
      debugPrint("AuthenticatorInterceptor token: $token");
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) async {
  //   if (err.response?.statusCode == 401) {
  //     await storage.deleteAll();
  //     navigatorKey.currentState?.pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) => const LoginScreen(),
  //       ),
  //     );
  //   } else {
  //     handler.next(err);
  //   }
  //   Future.value();
  // }
}