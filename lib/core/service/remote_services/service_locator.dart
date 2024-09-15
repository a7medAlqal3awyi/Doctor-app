import 'package:dio/dio.dart';
import 'package:dooc_app/feature/auth/login/logic/login_cubit.dart';
import 'package:dooc_app/feature/home/data/repo/get_specialization_repo_impl.dart';
import 'package:dooc_app/feature/home/logic/home_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../../feature/auth/login/data/repo/login_repo_impl.dart';
import '../../../feature/auth/sign_up/data/repo/register_repo_impl.dart';
import '../../../feature/auth/sign_up/logic/register_cubit.dart';
import '../../networking/dio_factory.dart';
import 'api_service.dart';
//dependency Injection

final getIt = GetIt.instance;

void setup() {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

 // login
  getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(getIt.get<ApiService>()));
  getIt.registerFactory<LoginCubit>(()=>LoginCubit(getIt()));
  // register
    getIt.registerSingleton<RegisterRepoImpl>(RegisterRepoImpl(getIt.get<ApiService>()));
    getIt.registerFactory<RegisterCubit>(()=>RegisterCubit(getIt()));

    // home

  getIt.registerSingleton<GetSpecializationsRepoImpl>(GetSpecializationsRepoImpl(getIt.get<ApiService>()));
  getIt.registerFactory<HomeCubit>(()=>HomeCubit(getIt()));
}
