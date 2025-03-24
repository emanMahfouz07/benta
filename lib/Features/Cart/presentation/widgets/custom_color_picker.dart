import 'package:benta/core/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomColorPicker extends StatelessWidget {
  const CustomColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: const CircleAvatar(
        backgroundColor: kPrimaryColor,
        radius: 21,
        child: CircleAvatar(radius: 20, backgroundColor: Color(0xff9D9484)),
      ),
    );
  }
}
