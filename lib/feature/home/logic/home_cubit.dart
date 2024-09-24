import 'package:dooc_app/feature/home/data/repo/get_specialization_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  GetSpecializationsRepoImpl repoImpl;

  HomeCubit(this.repoImpl) : super(HomeInitial());

  void fetchSpecializations() async {
    print('State: HomeSpecializationLoading');

    emit(HomeSpecializationLoading());
    final result = await repoImpl.getSpecializations();
    result.fold((failure) {
      print('State: HomeSpecializationError');

      emit(HomeSpecializationError(failure.errMessage));
    }, (success) {
      print('State: HomeSpecializationSuccess');

      emit(HomeSpecializationSuccess(success));
    });
  }
}
