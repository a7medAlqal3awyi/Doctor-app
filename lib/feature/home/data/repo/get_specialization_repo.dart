import 'package:dartz/dartz.dart';
import 'package:dooc_app/core/error/failure.dart';
import 'package:dooc_app/feature/home/data/models/specialization_response.dart';

abstract class GetSpecializationsRepo {
    Future<Either<Failure,SpecializationResponseModel>>getSpecializations();
}