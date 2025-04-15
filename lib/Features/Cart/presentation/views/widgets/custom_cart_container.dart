import 'package:benta/Features/Cart/presentation/views/widgets/small_counter.dart';
import 'package:benta/core/utils/api_services.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomCartContainer extends StatefulWidget {
  const CustomCartContainer({
    super.key,
    required this.title,
    required this.image,
    required this.rate,
    required this.price,
    required this.onTotalChanged,
    required this.cartItemId,
    required this.quantity,
  });

  final String title;
  final String image;
  final double rate;
  final String price;
  final Function(double) onTotalChanged;
  final int cartItemId;
  final int quantity;

  @override
  State<CustomCartContainer> createState() => _CustomCartContainerState();
}

class _CustomCartContainerState extends State<CustomCartContainer> {
  int count = 1;

  double get unitPrice => double.tryParse(widget.price) ?? 0;
  double get totalPrice => unitPrice * count;

  void updateCount(int newCount) {
    setState(() {
      count = newCount;
    });

    double total = unitPrice * newCount;
    widget.onTotalChanged(total);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Container(
        height: 120.h,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Container(
              width: 156.w,
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: kBGColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                ),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 20,
                      onPressed: () {},
                      icon: Icon(Icons.favorite_outline),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Image.asset(widget.image, fit: BoxFit.contain),
                    ),
                  ),
                ],
              ),
            ),

            // Right: Details and Counter
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: kSecondryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.r),
                    bottomRight: Radius.circular(8.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.style16.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(Icons.star, color: kPrimaryColor, size: 14.sp),
                        SizedBox(width: 4.w),
                        Text(
                          "(${widget.rate})",
                          style: Styles.style12.copyWith(color: kPrimaryColor),
                        ),
                      ],
                    ),
                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "\$${totalPrice.toStringAsFixed(2)}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.style18.copyWith(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        SmallCounter(
                          initialCount: widget.quantity,
                          onChanged: (newQuantity) async {
                            final prefs = await SharedPreferences.getInstance();
                            final userId = prefs.getInt('user_id');

                            if (userId != null) {
                              try {
                                await ApiServices(Dio()).updateCartItemQuantity(
                                  userId: userId,
                                  cartItemId: widget.cartItemId,
                                  quantity: newQuantity,
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Failed to update quantity'),
                                  ),
                                );
                              }
                            }
                          },
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
