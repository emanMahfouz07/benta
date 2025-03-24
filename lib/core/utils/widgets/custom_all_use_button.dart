import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAllUseButton extends StatelessWidget {
  const CustomAllUseButton({
    super.key,
    required this.title,
    this.onPressed,
    this.color,
  });
  final String title;
  final void Function()? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Text(
          title,
          style: Styles.style18.copyWith(fontSize: 18.sp, color: Colors.white),
        ),
      ),
    );
  }
}
