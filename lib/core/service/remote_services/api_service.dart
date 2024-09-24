import 'package:dio/dio.dart';
import 'package:dooc_app/core/helpers/constatnts.dart';
import 'package:dooc_app/core/helpers/shared_pref_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../local_services/cache_helper.dart';
import '../local_services/cache_keys.dart';
import 'endpoints.dart';

class ApiService {
  final Dio _dio;

   void setTokenIntoHeaderAfterLogin(String token) {
    _dio.options.headers = {
      'Authorization': 'Bearer $token',
    };
  }
  ApiService(this._dio) {
    print("ApiService ${CacheHelper.getSecuredString(CacheKeysManger.tokenStatus())}");

    // Initialize Dio settings and add PrettyDioLogger
    _initializeDio();
  }

  void _initializeDio() {
    // Add PrettyDioLogger to interceptors
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: false,
        responseHeader: false,
        compact: false,
        error: true,

        // logPrint: (object) => print(object), // Log output using print
      ),
    );

    // Uncomment this if you need AuthenticatorInterceptor
    // _dio.interceptors.add(AuthenticatorInterceptor());
  }

  Future<Response> postData({
    required String endPoint,
    bool sendToken = false,
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    _dio.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Accept-Language": CacheKeysManger.getUserLanguageFromCache(),
      if (sendToken)
        "Authorization": "Bearer ${CacheHelper.getSecuredString(SharedPrefKeys.userToken)}"
    };
    var response = await _dio.post(
      "${EndPoints.baseUrl}$endPoint",
      data: data,
      queryParameters: query,
    );
    return response;
  }

  Future<Response> postDataWithImage({
    required String endPoint,
    bool sendAuthToken = false,
    FormData? data,
    required Map<String, dynamic> query,
  }) async {
    _dio.options.headers = {
      "accept": "*/*",
      "Content-Type": "multipart/form-data",
      "Accept-Language": CacheKeysManger.getUserLanguageFromCache(),
      if (sendAuthToken)
        "Authorization": "Bearer ${CacheHelper.getData(key: CacheKeysManger.tokenStatus())}"
    };
    var response = await _dio.post(
      "${EndPoints.baseUrl}$endPoint",
      data: data,
      queryParameters: query,
    );
    return response;
  }

  Future<Response> postListData({
    required String endPoint,
    bool sendAuthToken = false,
    List<Map<String, dynamic>>? data,
  }) async {
    _dio.options.headers = {
      "Content-Type": "application/json",
      "Accept-Language": CacheKeysManger.getUserLanguageFromCache(),
    };
    var response = await _dio.post(
      "${EndPoints.baseUrl}$endPoint",
      data: data,
    );
    return response;
  }

  Future<Response> get({
    required String endPoint,
    bool sendToken = false,
    dynamic data,
    dynamic query,
  }) async {
    _dio.options.headers = {
      "Content-Type": "application/json",
      "Accept-Language": CacheKeysManger.getUserLanguageFromCache(),
      if (sendToken)
        "Authorization": "Bearer ${CacheHelper.getData(key: CacheKeysManger.tokenStatus())}"
    };
    var response = await _dio.get(
      '${EndPoints.baseUrl}$endPoint',
      queryParameters: query,
      data: data,
    );
    return response;
  }

  Future<Response> putData({
    required String endPoint,
    dynamic data,
  }) async {
    _dio.options.headers = {
      "accept": "*/*",
      "Content-Type": "application/json",
      "Authorization":
          "Bearer ${CacheHelper.getData(key: CacheKeysManger.tokenStatus())}",
      "Accept-Language": CacheKeysManger.getUserLanguageFromCache(),
    };
    var response = await _dio.put(
      '${EndPoints.baseUrl}$endPoint',
      data: data,
    );
    return response;
  }

  Future<Response> deleteData({
    required String endPoint,
    bool sendToken = false,
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    _dio.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Accept-Language": CacheKeysManger.getUserLanguageFromCache(),
      if (sendToken)
        "Authorization": "Bearer ${CacheHelper.getData(key: CacheKeysManger.tokenStatus())}"
    };
    var response = await _dio.delete(
      "${EndPoints.baseUrl}$endPoint",
      data: data,
      queryParameters: query,
    );
    return response;
  }
}
