import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Let's furnish your\nhome", style: Styles.style24medium),
          ],
        ),

        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Image.asset('assets/images/profile.png'),
        ),
      ],
    );
  }
}
