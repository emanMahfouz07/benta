import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class OfferItemContainer extends StatelessWidget {
  const OfferItemContainer({
    super.key,
    required this.title,
    required this.price,
    required this.rate,
    required this.image,
    required this.offerPrice,
    required this.off,
  });
  final String title;
  final String price;
  final String rate;
  final String image;
  final String offerPrice;
  final String off;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 14.w),
      child: GestureDetector(
        onTap: () {
          context.push(AppRouter.kItemInfoView);
        },
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 127.w,
                  height: 124.h,
                  decoration: BoxDecoration(
                    color: kBGColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    ),
                  ),
                  child: Stack(
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
                      SizedBox(height: 3.h),
                      Image.asset(image, height: 100.h, width: double.infinity),
                      Positioned(
                        bottom: 8.h,
                        left: 8.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 7.w,
                            vertical: 3.h,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff73888A),
                            borderRadius: BorderRadius.circular(100.r),
                          ),

                          child: Text(
                            '$off% off',
                            style: Styles.style12.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: 127.w,
              height: 68.h,
              padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
              decoration: BoxDecoration(
                color: Color(0xffD4DDDD),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: Styles.style14.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Icon(Icons.star, color: kPrimaryColor, size: 14),
                      SizedBox(width: 3.w),
                      Text(
                        "($rate)",
                        style: Styles.style10.copyWith(color: kPrimaryColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$$price",
                        style: Styles.style14.copyWith(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$$offerPrice',
                        style: Styles.style10.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: Color(0xffADADAD),
                        ),
                      ),

                      CircleAvatar(
                        radius: 12.r,
                        backgroundColor: kPrimaryColor,
                        child: Icon(
                          BoxIcons.bx_plus,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
