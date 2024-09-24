import 'package:dio/dio.dart';
import 'package:dooc_app/core/helpers/shared_pref_helper.dart';
import 'package:dooc_app/core/service/local_services/cache_helper.dart';
import 'package:dooc_app/core/service/remote_services/api_service.dart';
import 'package:dooc_app/feature/auth/login/data/model/login_response.dart';
import 'package:dooc_app/feature/auth/login/data/repo/login_repo_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/constatnts.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repo) : super(LoginInitial());
  final LoginRepoImpl repo;

  Future<void> userLogin(String email, String password) async {
    emit(LoginLoading());
    final result = await repo.login(email: email, password: password);
    result.fold((failure) => emit(LoginError(failure.errMessage)),
        (success) async {
      await saveUserToken(success.data?.token ?? '');
      emit(LoginSuccess(success));
    });
  }

  Future<void> saveUserToken(String token) async {
    CacheHelper.setSecuredString( SharedPrefKeys.userToken, token);
    ApiService(Dio()).setTokenIntoHeaderAfterLogin(token);
  }
}
