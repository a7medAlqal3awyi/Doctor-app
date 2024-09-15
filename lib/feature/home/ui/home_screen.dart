import 'package:dooc_app/core/helpers/spacing.dart';
import 'package:dooc_app/core/themeing/app_colors.dart';
import 'package:dooc_app/core/widget/app_button.dart';
import 'package:dooc_app/feature/home/data/models/specialization_response.dart';
import 'package:dooc_app/feature/home/logic/home_cubit.dart';
import 'package:dooc_app/feature/home/logic/home_state.dart';
import 'package:dooc_app/feature/home/ui/widgets/doctor_blue_container.dart';
import 'package:dooc_app/feature/home/ui/widgets/doctor_list_view.dart';
import 'package:dooc_app/feature/home/ui/widgets/doctor_speciality_list_view.dart';
import 'package:dooc_app/feature/home/ui/widgets/home_tap_bar.dart';
import 'package:dooc_app/feature/home/ui/widgets/specialization_and_doctor_blco_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/themeing/styles.dart';
import '../../../core/widget/double_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(
            20.0,
            16.0,
            20.0,
            28.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTapBar(),
              verticalSpacing(20),
              const DoctorBlueContainer(),
              verticalSpacing(20),
              const DoubleText(
                firstText: "Doctor Speciality",
                secondText: "See All",
              ),
              verticalSpacing(20),
              const SpecializationAndDoctorBlcoBuilder()
            ],
          ),
        ),
      ),
    );
  }


}
