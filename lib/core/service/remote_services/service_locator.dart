import 'package:dio/dio.dart';
import 'package:dooc_app/feature/auth/login/logic/login_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../../feature/auth/login/data/repo/login_repo_impl.dart';
import '../../../feature/auth/sign_up/data/repo/register_repo_impl.dart';
import '../../../feature/auth/sign_up/logic/register_cubit.dart';
import 'api_service.dart';
//dependency Injection

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
 // login
  getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(getIt.get<ApiService>()));
  getIt.registerFactory<LoginCubit>(()=>LoginCubit(getIt()));
// register
  getIt.registerSingleton<RegisterRepoImpl>(RegisterRepoImpl(getIt.get<ApiService>()));
  getIt.registerFactory<RegisterCubit>(()=>RegisterCubit(getIt()));

}
//AH010@khaled
//aa7med@gmail.com