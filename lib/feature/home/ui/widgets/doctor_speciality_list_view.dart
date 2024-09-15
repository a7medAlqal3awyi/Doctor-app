import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/themeing/styles.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> docSpiclaist = [
      "assets/svgs/home/general.svg",
      "assets/svgs/home/notification.svg",
      "assets/svgs/home/nuro.svg",
      "assets/svgs/home/Pediatric.svg",
      "assets/svgs/home/Radiology.svg",
    ];
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
            child: Column(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFF4F8FF),
                  ),
                  child: SvgPicture.asset(
                    "assets/svgs/home/notification.svg",
                  ),
                ),
                verticalSpacing(8),
                Text(
                  "General",
                  style: TextStyles.font12BlackW400,
                )
              ],
            ),
          );
        },
        itemCount: 8,
      ),
    );
  }
}
