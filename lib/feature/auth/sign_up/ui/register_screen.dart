import 'package:dooc_app/core/helpers/spacing.dart';
import 'package:dooc_app/core/themeing/styles.dart';
import 'package:dooc_app/feature/auth/login/ui/widgets/terms_and_conditions.dart';
import 'package:dooc_app/feature/auth/sign_up/ui/widgets/already_have_account.dart';
import 'package:dooc_app/feature/auth/sign_up/ui/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create Account",
                    style: TextStyles.font24BlueW700,
                  ),
                  verticalSpacing(8),
                  Text(
                    "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                    style: TextStyles.font14GreyW400.copyWith(fontSize: 14.sp),
                  ),
                  const RegisterForm(),
                  verticalSpacing(10),
                  const TermsAndConditions(),
                  verticalSpacing(10),
                  const AlreadyHaveAccount(),
                ],
              ),
            ),
          ),
        ));
  }
}
