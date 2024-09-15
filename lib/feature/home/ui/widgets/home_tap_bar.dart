import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/themeing/styles.dart';

class HomeTapBar extends StatelessWidget {
  const HomeTapBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Ahmed!',
              style: TextStyles.font18BlackW700,
            ),
            Text(
              'How Are you Today?',
              style: TextStyles.font14moreLighterGreyW400,
            ),
          ],
        ),
        Container(
          width: 48.w,
          height: 48.h,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xFFF5F5F5)),
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: SvgPicture.asset(
                "assets/svgs/home/notification.svg"),
          ),
        )
      ],
    );
  }
}
