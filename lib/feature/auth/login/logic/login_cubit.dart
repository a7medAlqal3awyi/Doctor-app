import 'package:dooc_app/feature/auth/login/data/model/login_response.dart';
import 'package:dooc_app/feature/auth/login/data/repo/login_repo_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repo) : super(LoginInitial());
  final LoginRepoImpl repo;

  Future<void> userLogin(String email, String password) async {
    emit(LoginLoading());
    final result = await repo.login(email: email, password: password);
    result.fold(
      (failure) => emit(LoginError(failure.errMessage)),
      (success) => emit(LoginSuccess(success)),
    );
  }
}
