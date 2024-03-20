import 'package:dooc_app/core/helpers/spacing.dart';
import 'package:dooc_app/core/themeing/styles.dart';
import 'package:dooc_app/feature/login/ui/widgets/dont_have_an_account.dart';
import 'package:dooc_app/feature/login/ui/widgets/email_and_password.dart';
import 'package:dooc_app/feature/login/ui/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widget/app_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back",
                style: TextStyles.font24BlueW700,
              ),
              verticalSpacing(8),
              Text(
                "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                style: TextStyles.font14GreyW400.copyWith(fontSize: 14.sp),
              ),
              const EmailAndPassword(),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  "Forgot Password?",
                  style: TextStyles.font13BlueW400,
                ),
              ),
              verticalSpacing(40),
              AppTextButton(
                  onPressed: () {},
                  buttonText: 'Login',
                  buttonTextStyle: TextStyles.font16WhiteW600),
              verticalSpacing(16),
              const TermsAndConditions(),
              verticalSpacing(60),
              const DontHaveAnAccount(),
            ],
          ),
        ),
      ),
    ));
  }
}
