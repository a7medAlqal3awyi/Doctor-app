import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/service/remote_services/api_service.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/service/local_services/cache_helper.dart';
import '../../../../../core/service/local_services/cache_keys.dart';
import '../../../../../core/service/remote_services/endpoints.dart';
import '../model/login_response.dart';
import 'login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiService service;

  LoginRepoImpl(this.service);

  @override
  Future<Either<Failure, LoginResponseModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await service.postData(
        endPoint: EndPoints.loginEndPoint,
        data: {
          'email': email,
          'password': password,
        },
      );

      // Check if the status code is 200 (success)
      if (response.statusCode == 200) {
        // Save token to cache
        CacheHelper.saveData(key: CacheKeysManger.tokenStatus(), value: response.data['data']['token']);
        debugPrint('token: ${response.data['data']['token']}');

        // Parse the response to your model
        final result = LoginResponseModel.fromJson(response.data);
        return Right(result);
      } else {
        // If the status code is not 200, handle it as an error
        return Left(ServerFailure('Unexpected status code: ${response.statusCode}'));
      }
    } catch (e) {
      // Catch DioException and other errors
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
