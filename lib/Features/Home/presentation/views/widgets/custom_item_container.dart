import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class CustomItemContainer extends StatelessWidget {
  const CustomItemContainer({
    super.key,
    required this.title,
    required this.price,
    required this.rate,
    required this.image,
  });
  final String title;
  final String price;
  final String rate;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: GestureDetector(
        onTap: () {
          context.push(AppRouter.kItemInfoView);
        },
        child: Container(
          width: 127.w,

          decoration: BoxDecoration(
            color: kBGColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: CircleAvatar(
                      radius: 12.r,
                      backgroundColor: Colors.white,
                      child: Icon(
                        FontAwesome.heart,
                        color: kPrimaryColor,
                        size: 17,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image.asset(
                      image,
                      height: 100.h,
                      width: double.infinity,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(title, style: Styles.style16),
                        SizedBox(width: 10.w),
                        Icon(Icons.star, color: kPrimaryColor, size: 14),
                        SizedBox(width: 5.w),
                        Text(
                          "($rate)",
                          style: Styles.style14.copyWith(color: kPrimaryColor),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$$price",
                          style: Styles.style18.copyWith(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        CircleAvatar(
                          radius: 18.r,
                          backgroundColor: kPrimaryColor,
                          child: Icon(BoxIcons.bx_plus, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
