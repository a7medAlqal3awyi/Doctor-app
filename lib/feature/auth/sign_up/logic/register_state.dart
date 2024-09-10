part of 'register_cubit.dart';



sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class RegisterLoading extends RegisterState {}
final class RegisterSuccess extends RegisterState {
  final RegisterResponseModel model ;

  RegisterSuccess(this.model);
}
final class RegisterError extends RegisterState {
  final String errorMessage;

  RegisterError(this.errorMessage);
}
