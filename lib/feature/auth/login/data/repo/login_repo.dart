import 'package:dartz/dartz.dart';
import 'package:dooc_app/core/error/failure.dart';

import '../model/login_response.dart';

abstract class LoginRepo{

  Future<Either<Failure,LoginResponseModel>>login( {
    required String email,
    required String password,
  });
}