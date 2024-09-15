import 'package:dooc_app/feature/home/data/models/specialization_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/themeing/styles.dart';
import 'doctor_list_view_item.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctors>?doctorsList;
  const DoctorsListView({super.key, required this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList?.length,
          itemBuilder: (context, index) {
        return DoctorListViewItem(
          index: index,
          doctorsModel: doctorsList![index],
        );
      }),
    );
  }
}
