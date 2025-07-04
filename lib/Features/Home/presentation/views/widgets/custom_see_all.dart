import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomSeeAllWidget extends StatelessWidget {
  const CustomSeeAllWidget({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Styles.style24),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'See All',
            style: Styles.style16.copyWith(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
