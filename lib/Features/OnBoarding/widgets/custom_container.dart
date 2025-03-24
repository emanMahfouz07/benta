import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: Styles.style18.copyWith(color: Colors.white)),
        Icon(Icons.arrow_forward_ios, color: Colors.white),
      ],
    );
  }
}
