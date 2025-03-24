import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 127.w,
      height: 250.h,
      margin: EdgeInsets.all(5),
      child: Card(
        elevation: 0,
        color: kBGColor,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: Icon(
                    FontAwesome.heart,
                    color: kPrimaryColor,
                    size: 17,
                  ),
                ),
                Image.asset('assets/images/mandi-arm-chair-in-cream 2.png'),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    color: Color(0xff73888A),
                    borderRadius: BorderRadius.circular(100),
                  ),

                  child: Text(
                    '30% off',
                    style: Styles.style12.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,

              child: Container(
                width: double.infinity,
                color: Color(0xffD4DDDD),
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Sofa", style: Styles.style16),
                        SizedBox(width: 10),
                        Icon(Icons.star, color: kPrimaryColor, size: 10),
                        SizedBox(width: 5),
                        Text(
                          "(4.5)",
                          style: Styles.style10.copyWith(color: kPrimaryColor),
                        ),
                        SizedBox(height: 4),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$80",
                          style: Styles.style16.copyWith(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '\$100',
                          style: Styles.style14.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: Color(0xffADADAD),
                          ),
                        ),

                        CircleAvatar(
                          radius: 15,
                          backgroundColor: kPrimaryColor,
                          child: Icon(BoxIcons.bx_plus, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
