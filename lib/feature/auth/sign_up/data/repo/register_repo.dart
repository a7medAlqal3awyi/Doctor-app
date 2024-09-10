import 'package:dartz/dartz.dart';
import 'package:dooc_app/core/error/failure.dart';

import '../model/register_response.dart';

abstract class RegisterRepo{

  Future<Either<Failure,RegisterResponseModel>>register( {
    required String email,
    required String name,
    required String phone,
    required String gender,
    required String password,
    required String passwordConfirmation,
  });
}