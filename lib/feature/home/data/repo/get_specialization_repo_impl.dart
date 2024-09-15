import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dooc_app/core/error/failure.dart';
import 'package:dooc_app/core/service/remote_services/api_service.dart';
import 'package:dooc_app/core/service/remote_services/endpoints.dart';
import 'package:dooc_app/feature/home/data/models/specialization_response.dart';

import 'get_specialization_repo.dart';

class GetSpecializationsRepoImpl implements GetSpecializationsRepo {
  final ApiService apiService;

  GetSpecializationsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, SpecializationResponseModel>>
      getSpecializations() async {
    try {
      final result = await apiService.get(
        endPoint: EndPoints.specializationEndPoint,
        sendToken: true,
      );

      final response = SpecializationResponseModel.fromJson(result.data);
      return Right(response);
    }   catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      } else {
        return left(ServerFailure(error.toString()));
      }
    }
  }
}
