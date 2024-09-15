import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/themeing/app_colors.dart';
import '../../../../core/themeing/styles.dart';
import '../../../../core/widget/app_button.dart';

class DoctorBlueContainer extends StatelessWidget {
  const DoctorBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 343.w,
          height: 167.h,
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              image: DecorationImage(
                fit: BoxFit.cover,
                  image: AssetImage("assets/images/home_blue_background.png"))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Book and\nschedule with\nnearest doctor",
                style: TextStyles.font18BlackW700.copyWith(
                  textBaseline: TextBaseline.alphabetic,
                  color: Colors.white,
                ),
              ),
              verticalSpacing(20),
              AppTextButton(
                  backgroundColor: Colors.white,
                  buttonWidth: 110.w,
                  buttonHeight: 40.h,
                  borderRadius: 48,
                  verticalPadding: 0,
                  horizontalPadding: 0,
                  onPressed: () {},
                  buttonText: "Find Nearby",
                  buttonTextStyle: TextStyles.font14BlueW600),
            ],
          ),
        ),
        Positioned(
          right: 20,
          top: -50,
          child: Image.asset(
              height: 250, fit: BoxFit.cover, "assets/images/nurse.png"),
        ),
      ],
    );
  }
}
