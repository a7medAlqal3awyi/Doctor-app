import '../data/models/specialization_response.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeSpecializationLoading extends HomeState {}

final class HomeSpecializationSuccess extends HomeState {
  final SpecializationResponseModel model;

  HomeSpecializationSuccess(this.model);
}

final class HomeSpecializationError extends HomeState {
  final String error;

  HomeSpecializationError(this.error);
}
