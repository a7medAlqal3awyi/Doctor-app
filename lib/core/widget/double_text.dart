import 'package:flutter/material.dart';

import '../themeing/styles.dart';

class DoubleText extends StatelessWidget {
  final String firstText;
  final String secondText;

  const DoubleText(
      {super.key, required this.firstText, required this.secondText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(firstText,
            style: TextStyles.font18BlackW700
                .copyWith(fontWeight: FontWeight.w600)),
        Text(secondText, style: TextStyles.font13BlueW400),
      ],
    );
  }
}
