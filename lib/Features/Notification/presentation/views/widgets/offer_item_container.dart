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
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: GestureDetector(
        onTap: () {
          context.push(AppRouter.kItemInfoView);
        },
        child: Container(
          width: screenSize.width * 0.43,
          decoration: BoxDecoration(
            color: kBGColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,

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
                  Image.asset(
                    image,
                    height: 100.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  Positioned(
                    bottom: 0,
                    left: 10.w,
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

              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: Color(0xffD4DDDD),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.r),
                    bottomRight: Radius.circular(8.r),
                  ),
                ),

                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: [
                        Text(title, style: Styles.style16),
                        SizedBox(width: 10.w),
                        Icon(Icons.star, color: kPrimaryColor, size: 10),
                        SizedBox(width: 5.w),
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
                          style: Styles.style16.copyWith(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '\$$offerPrice',
                          style: Styles.style14.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: Color(0xffADADAD),
                          ),
                        ),

                        CircleAvatar(
                          radius: 15.r,
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
