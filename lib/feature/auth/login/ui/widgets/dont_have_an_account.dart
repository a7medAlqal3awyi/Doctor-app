import 'package:dooc_app/core/helpers/exetention.dart';
import 'package:dooc_app/core/themeing/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routing/routes.dart';


class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Don't have an account!",
              style: TextStyles.font14darkBlueW500,
            ),
            TextSpan(
                text: " Sign Up",
                style: TextStyles.font14BlueW600,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.pushReplacementNamed(Routes.registerScreen);
                  }),
          ],
        ),
      ),
    );
  }
}
