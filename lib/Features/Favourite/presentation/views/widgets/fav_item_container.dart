import 'package:benta/Features/Cart/presentation/widgets/small_counter.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

class FavouriteItemContainer extends StatelessWidget {
  const FavouriteItemContainer({
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
      padding: EdgeInsets.only(bottom: 14.0.h),
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
                  Flexible(
                    child: Center(child: Image.asset(image, fit: BoxFit.cover)),
                  ),
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
                padding: EdgeInsets.all(8.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          softWrap: true,
                          title,
                          style: Styles.style16.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Icon(Icons.star, color: kPrimaryColor, size: 12.r),
                        SizedBox(width: 4.w),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          "($rate)",
                          style: Styles.style12.copyWith(color: kPrimaryColor),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            "\$$price",
                            softWrap: true,
                            style: Styles.style18.copyWith(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 15.r,
                          backgroundColor: kPrimaryColor,
                          child: Icon(
                            BoxIcons.bx_plus,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
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
