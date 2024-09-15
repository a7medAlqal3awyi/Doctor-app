import 'package:dooc_app/feature/home/data/models/specialization_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/themeing/styles.dart';

class DoctorListViewItem extends StatelessWidget {
  final Doctors doctorsModel;
  final int index;

  const DoctorListViewItem(
      {super.key, required this.doctorsModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 126.h,
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          Container(
            width: 110.w,
            height: 110.h,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Image.network(
              fit: BoxFit.cover,
              // doctorsModel.photo ??
                  "https://media.licdn.com/dms/image/v2/D4D03AQEE9uOWz-qAMg/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1724948154735?e=1731542400&v=beta&t=ljvgcV17zC394mBMWYcXpaDuJCImeUctPeL_Tv6EP8Y",
            ),
          ),
          horizontalSpacing(14),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorsModel.name ?? "Dr. Ahmed Al-kalawyi",
                  style: TextStyles.font16BlackW700,
                ),
                verticalSpacing(10),
                Text(
                  "${doctorsModel.degree} | ${doctorsModel.phone}",
                  style: TextStyles.font14lightGreyW500
                      .copyWith(color: const Color(0xFF757575)),
                ),
                verticalSpacing(10),
                Text(
                  doctorsModel.email ?? "Email",
                  style: TextStyles.font14lightGreyW500.copyWith(
                      color: const Color(0xFF757575), fontWeight: FontWeight.w400),
                ),
              ])
        ],
      ),
    );
  }
}
