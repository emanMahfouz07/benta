import 'package:benta/Features/Cart/presentation/widgets/small_counter.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCartContainer extends StatelessWidget {
  const CustomCartContainer({
    super.key,
    required this.title,
    required this.image,
    required this.rate,
    required this.price,
  });
  final String title;
  final String image;
  final double rate;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 120.h,

              decoration: BoxDecoration(
                color: kBGColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                ),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline),
                  ),
                  Flexible(child: Center(child: Image.asset(image))),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 120.h,
              decoration: BoxDecoration(
                color: kSecondryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                ),
              ),

              child: Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            softWrap: true,
                            title,
                            style: Styles.style16.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(Icons.star, color: kPrimaryColor, size: 12),
                        SizedBox(width: 4.w),
                        Flexible(
                          child: Text(
                            "($rate)",
                            style: Styles.style12.copyWith(
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Text(
                            "\$$price",
                            softWrap: true,
                            style: Styles.style18.copyWith(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        SmallCounter(),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
