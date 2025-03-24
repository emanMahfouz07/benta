import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TotalPriceContainer extends StatelessWidget {
  const TotalPriceContainer({
    super.key,
    required this.price,
    required this.itemsCount,
  });
  final double price;
  final int itemsCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBGColor,
        border: Border.all(color: Color(0xff9AADAF), width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Total price', style: Styles.style20),
              Spacer(),
              Text(
                "\$$price",
                style: Styles.style18.copyWith(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            '$itemsCount Items',
            style: Styles.style18.copyWith(color: kLightGreyColor),
          ),
        ],
      ),
    );
  }
}
