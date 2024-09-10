import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../../feature/auth/login/data/repo/login_repo_impl.dart';
import 'api_service.dart';
//dependency Injection

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(getIt.get<ApiService>()));

}
