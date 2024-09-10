import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/register_response.dart';
import '../data/repo/register_repo_impl.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.repo) : super(RegisterInitial());
  final RegisterRepoImpl repo;

  Future<void> userRegister(String email, String password, String name,
      String phone, String passwordConfirmation) async {
    emit(RegisterLoading());
    final result = await repo.register(
      name: name,
      email: email,
      phone: phone,
      gender: 0.toString(),
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
    result.fold(
      (failure) => emit(RegisterError(failure.errMessage)),
      (success) => emit(RegisterSuccess(success)),
    );
  }
}
