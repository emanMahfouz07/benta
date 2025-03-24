import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, this.suffixIcon});
  final IconData? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.only(right: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xffF1F4F4),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: kLightGreyColor),
                suffixIcon: Icon(suffixIcon),
                suffixIconColor: kPrimaryColor,
                hintText: "Search",
                border: InputBorder.none,
              ),
              style: Styles.style16.copyWith(color: kLightGreyColor),
            ),
          ),
          const Icon(Icons.mic_outlined, color: kPrimaryColor),
        ],
      ),
    );
  }
}
