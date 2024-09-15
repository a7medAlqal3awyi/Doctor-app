import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';
import 'doctor_list_view.dart';
import 'doctor_speciality_list_view.dart';

class SpecializationAndDoctorBlcoBuilder extends StatelessWidget {
  const SpecializationAndDoctorBlcoBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeInitial) {
          return setUpLoading();
        }
        if (state is HomeSpecializationLoading) {
          return setUpLoading();
        } else if (state is HomeSpecializationSuccess) {
          var model = state.model;
          return setUpSuccess(model);
        } else if (state is HomeSpecializationError) {
          return setUpError();
        }
        return const SizedBox.shrink();
      },
    );
  }
}

Widget setUpLoading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget setUpError() {
  return const SizedBox.shrink();
}

Widget setUpSuccess(model) {
  return Expanded(
    child: Column(
      children: [
        DoctorsSpecialityListView(specializationDataList: model.data!),
        verticalSpacing(10),
        DoctorsListView(
          doctorsList: model.data![2].doctors,
        ),
      ],
    ),
  );
}
