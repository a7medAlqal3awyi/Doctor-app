import 'package:dooc_app/core/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation ({super.key, required this.passwordController});
  final TextEditingController passwordController ;

  @override
  Widget build(BuildContext context) {
    return               FlutterPwValidator(
      controller: passwordController,
      minLength: 6,
      uppercaseCharCount: 2,
      lowercaseCharCount:6,
      numericCharCount: 2,
      specialCharCount: 1,
      width: 400.w,
      height: 170.h,
      defaultColor: Colors.grey,
      onSuccess: () {
        toast(text: "Password is matched", color: Colors.green);
      },
      onFail: () {
        print("NOT MATCHED");
      },
    );
  }
}
