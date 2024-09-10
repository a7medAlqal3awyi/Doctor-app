import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/service/remote_services/api_service.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/service/local_services/cache_helper.dart';
import '../../../../../core/service/local_services/cache_keys.dart';
import '../../../../../core/service/remote_services/endpoints.dart';
import '../model/register_response.dart';
import 'register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final ApiService service;

  RegisterRepoImpl(this.service);

  @override
  Future<Either<Failure, RegisterResponseModel>> register(
      {required String email,
      required String name,
      required String phone,
      required String gender,
      required String password,
      required String passwordConfirmation}) async {
    try {
      final response = await service.postData(

        endPoint: EndPoints.registerEndPoint,
        data: {

          'name': name,
          'email': email,
          'phone': phone,
          'gender': gender,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );

      // Check if the status code is 200 (success)
      if (response.statusCode == 200) {
        // Save token to cache
        CacheHelper.saveData(
            key: CacheKeysManger.tokenStatus(),
            value: response.data['data']['token']);
        debugPrint('token: ${response.data['data']['token']}');

        // Parse the response to your model
        final result = RegisterResponseModel.fromJson(response.data);
        return Right(result);
      } else {
        // If the status code is not 200, handle it as an error
        return Left(
            ServerFailure('Unexpected status code: ${response.statusCode}'));
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
