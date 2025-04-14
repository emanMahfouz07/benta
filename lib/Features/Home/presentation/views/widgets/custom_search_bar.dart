import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, this.suffixIcon, this.customICon});
  final IconData? suffixIcon;
  final IconData? customICon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xffF1F4F4),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onDoubleTap: () {
                context.push(AppRouter.kSearchView);
              },
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
          ),
          Icon(customICon, color: kPrimaryColor),
        ],
      ),
    );
  }
}
