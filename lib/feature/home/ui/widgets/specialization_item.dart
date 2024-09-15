import 'package:dooc_app/feature/home/data/models/specialization_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/themeing/styles.dart';

class SpecializationItem extends StatelessWidget {
  final int itemIndex;
  final SpecializationData specializationData;

  const SpecializationItem(
      {super.key, required this.itemIndex, required this.specializationData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFFF4F8FF),
            radius: 28.r,
            child: SvgPicture.asset(
              width: 40.w,
              height: 40.h,
              "assets/svgs/home/general_speciality.svg",
            ),
          ),
          verticalSpacing(8),
          Text(
            specializationData.name ?? "General",
            style: TextStyles.font12BlackW400,
          )
        ],
      ),
    );
  }
}
